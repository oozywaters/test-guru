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
    # @user.badges << badge
  end

  def all_tests_by_category_passed?(category_title)
    category = Category.find_by(title: category_title)
    return false if @test_passage.test.category != category
    @user.passed_tests_by_category(category).count == category.tests.count
  end
end