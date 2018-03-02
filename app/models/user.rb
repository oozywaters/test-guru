class User < ApplicationRecord
  has_many :tests_user
  has_many :tests, through: :tests_user
  has_many :tests_created, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    tests.where(level: level)
  end
end
