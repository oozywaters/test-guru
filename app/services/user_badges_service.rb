class UserBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      give_badge(badge) if send(badge.rule, badge.rule_parameter)
    end
  end

  private

  def give_badge(badge)
    @user.badges << badge
  end

  def all_tests_by_category_passed?(category_title)
    category = Category.find_by(title: category_title)
    return false if @test_passage.test.category != category
    @user.passed_tests_by_category(category).count == category.tests.count
  end

  def passed_test_on_the_first_try?(parameters)
    @user.tests.where(id: @test_passage.test.id).count == 1
  end

  def passed_all_tests_by_level?(level)
    @user.passed_tests_by_level(level).count == Test.where(level: level).count
  end
end