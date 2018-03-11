class Test < ActiveRecord::Base
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  def self.by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
