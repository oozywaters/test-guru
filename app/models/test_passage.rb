class TestPassage < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def current_question_number
    questions_count - next_questions.count
  end

  def questions_count
    test.questions.count
  end

  private

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end