require "test_helper"

class AuthorizationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get authorization_index_url
    assert_response :success
  end
end
