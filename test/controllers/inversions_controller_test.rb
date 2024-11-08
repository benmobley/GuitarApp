require "test_helper"

class InversionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get inversions_show_url
    assert_response :success
  end
end
