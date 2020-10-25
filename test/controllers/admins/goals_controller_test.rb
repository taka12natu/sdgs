require 'test_helper'

class Admins::GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_goals_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_goals_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_goals_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_goals_update_url
    assert_response :success
  end

end
