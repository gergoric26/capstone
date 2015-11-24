class YourOrdersController < ApplicationController
  
  def all_orders
    @orders = current_vendor.orders
  end

  def order
  end

end
