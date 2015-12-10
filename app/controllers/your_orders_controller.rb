class YourOrdersController < ApplicationController

  include CurrentCart
  before_action :set_cart, except: [:all_orders, :order]
  
  def all_orders
    @vendor_orders = current_vendor.vendor_orders
  end

  def order
   @vendor_order = current_vendor.vendor_orders.find(params[:id])
   @order = @vendor_order.order
  end

end
