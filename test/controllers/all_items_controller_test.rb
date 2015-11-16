require 'test_helper'

class AllItemsControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

end
