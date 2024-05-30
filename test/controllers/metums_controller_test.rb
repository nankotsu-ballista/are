require "test_helper"

class MetumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get metums_new_url
    assert_response :success
  end
end
