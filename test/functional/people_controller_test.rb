require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "should get post_sign_up" do
    get :post_sign_up
    assert_response :success
  end

end
