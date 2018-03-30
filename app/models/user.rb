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

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :password, :email, presence: true
  validates :email, format: EMAIL_FORMAT, uniqueness: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def fullname
    "#{firstname} #{lastname}"
  end

  def admin?
    is_a?(Admin)
  end
end
