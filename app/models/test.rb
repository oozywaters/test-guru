class Test < ActiveRecord::Base
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions

  def self.by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
