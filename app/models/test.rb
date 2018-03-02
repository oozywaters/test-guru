class Test < ActiveRecord::Base
  has_many :tests_user
  has_many :users, through: :tests_user
  belongs_to :author, class_name: 'User'
  belongs_to :category

  def self.by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
