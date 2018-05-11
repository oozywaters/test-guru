BADGE_RULES = [
  ['Прохождение всех тестов категории', 'all_tests_by_category_passed?'],
  ['Прохождение теста с первой попытки', 'condition2'],
  ['Прохождение всех тестов определенного уровня', 'condition3']
].freeze

class Badge < ApplicationRecord
  def self.rules
    BADGE_RULES
  end
end
