class TestPassage < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_number
    questions_count - next_questions.count
  end

  def questions_count
    test.questions.count
  end

  def success_rate
    correct_questions * 100 / questions_count
  end

  def completed?
    current_question.nil?
  end

  def passed?
    return false unless completed?
    success_rate > 85
  end

  def remaining_time
    (expires_at - Time.current).to_i
  end

  def time_is_out?
    remaining_time <= 0
  end

  private

  def expires_at
    return created_at + 1.year unless test.timer
    created_at + test.timer.seconds
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    return test.questions unless current_question
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def before_validation_set_current_question
    self.current_question = next_questions.first if test.present?
  end
end