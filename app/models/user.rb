class User < ApplicationRecord
  validates :username, :password, :email, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    tests.by_level(level)
  end
end
