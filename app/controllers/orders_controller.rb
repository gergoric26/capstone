class OrdersController < ApplicationController

  include CurrentCart
  before_action :set_cart, only:[:new, :create]

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @orders = @vendor.orders
  end

  def show
  end

  def new
    if @cart.line_items.empty?
      redirect_to all_items_all_path, notice: "Your cart is empty!"
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(params[:vendor_id])
    @order.vendor = current_vendor
    @order.add_line_items_form_cart(@cart)
    
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to vendor_orders_path(current_vendor), notice: "Thank you for placing the order."
    else
      flash[:error] = "Error placing the order. Please try again."
      render :new
    end
  end


  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(order_params)
    
    if @order.save
      flash[:notice] = "Order was updated."
      redirect_to vendor_orders_path(current_vendor)
    else
      flash[:error] = "There was an error updating the item. Please try again."
      render :edit
    end
  end

  def edit
    @order = Order.find(params[:id])
    
  end

  def destroy
    @order = Order.find(params[:id])
    
     if @order.destroy
       flash[:notice] = "Order was deleted successfully."
       redirect_to vendor_items_path(current_vendor)
     else
       flash[:error] = "There was an error deleting the order."
       render :index
     end
  end

  private

  def order_params
    params.require(:order).permit(:vendor_id)
  end

end