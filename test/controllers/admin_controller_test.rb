require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get complaints" do
    get admin_complaints_url
    assert_response :success
  end

  test "should get show_complaint" do
    get admin_show_complaint_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end
end
