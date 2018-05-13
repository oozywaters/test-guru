BADGE_RULES = [
  ['Прохождение всех тестов категории', 'all_tests_by_category_passed?'],
  ['Прохождение теста с первой попытки', 'passed_test_on_the_first_try?'],
  ['Прохождение всех тестов определенного уровня', 'passed_all_tests_by_level?']
].freeze

class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  def self.rules
    BADGE_RULES
  end
end
