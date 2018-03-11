class Question < ApplicationRecord
  validates :body, presence: true
  validate :validate_answers_count

  belongs_to :test
  has_many :answers

  private

  def validate_answers_count
    errors.add(:answers, 'You must add from 1 to 4 answers') unless (1..4).include?(answers.size)
  end
end
