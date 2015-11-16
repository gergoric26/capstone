require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get vendor" do
    get :vendor
    assert_response :success
  end

end
