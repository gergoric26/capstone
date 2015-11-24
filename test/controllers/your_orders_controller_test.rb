require 'test_helper'

class YourOrdersControllerTest < ActionController::TestCase
  test "should get all_orders" do
    get :all_orders
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

end
