class Test < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :category
  # has_and_belongs_to_many :users

  def self.tests_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(:title)
      .pluck(:title)
  end
end
