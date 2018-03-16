class Answer < ApplicationRecord
  validates :text, presence: true

  belongs_to :question

  scope :correct, -> { where(correct: true) }
end
