class User < ApplicationRecord
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :password, :email, presence: true
  validates :email, format: EMAIL_FORMAT, uniqueness: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: 'author_id'

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
