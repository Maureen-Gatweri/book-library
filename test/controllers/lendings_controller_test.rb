require "test_helper"

class LendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lendings_create_url
    assert_response :success
  end

  test "should get update" do
    get lendings_update_url
    assert_response :success
  end
end
