class Test < ActiveRecord::Base
  validates :title, presence: true
  validates :level, numericality: { only_integer: true }, inclusion: 1..10
  validates :title, uniqueness: { scope: :level }

  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end
end
