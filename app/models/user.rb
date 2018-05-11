class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_category(category)
    tests.where(category: category).distinct
  end

  def fullname
    "#{firstname} #{lastname}"
  end

  def admin?
    is_a?(Admin)
  end
end
