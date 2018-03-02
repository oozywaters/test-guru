class Test < ActiveRecord::Base
  has_many :tests_user
  has_many :users, through: :tests_user
  belongs_to :author, class_name: 'User'
  belongs_to :category

  def self.tests_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(:title)
      .pluck(:title)
  end
end
