require 'test_helper'

class StaticsControllerTest < ActionController::TestCase
  test "should get sean" do
    get :sean
    assert_response :success
  end

end
