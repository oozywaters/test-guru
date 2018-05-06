class Feedback
  include ActiveModel::Model

  attr_accessor :title, :body

  validates :title, :body, presence: true
end
