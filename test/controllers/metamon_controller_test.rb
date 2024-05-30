require "test_helper"

class MetamonControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get metamon_new_url
    assert_response :success
  end
end
