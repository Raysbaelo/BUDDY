require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit_profile" do
    get users_edit_profile_url
    assert_response :success
  end
end
