require "test_helper"

class WControllerTest < ActionDispatch::IntegrationTest
  test "should get i" do
    get w_i_url
    assert_response :success
  end
end
