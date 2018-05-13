require 'test_helper'

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_badge = admin_badges(:one)
  end

  test "should get index" do
    get admin_badges_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_badge_url
    assert_response :success
  end

  test "should create admin_badge" do
    assert_difference('Admin::Badge.count') do
      post admin_badges_url, params: { admin_badge: {  } }
    end

    assert_redirected_to admin_badge_url(Admin::Badge.last)
  end

  test "should show admin_badge" do
    get admin_badge_url(@admin_badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_badge_url(@admin_badge)
    assert_response :success
  end

  test "should update admin_badge" do
    patch admin_badge_url(@admin_badge), params: { admin_badge: {  } }
    assert_redirected_to admin_badge_url(@admin_badge)
  end

  test "should destroy admin_badge" do
    assert_difference('Admin::Badge.count', -1) do
      delete admin_badge_url(@admin_badge)
    end

    assert_redirected_to admin_badges_url
  end
end
