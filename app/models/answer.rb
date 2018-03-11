class Answer < ApplicationRecord
  validates :body, presence: true

  belongs_to :question

  scope :correct, -> { where(correct: true) }
end
