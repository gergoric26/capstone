class OrdersController < ApplicationController

  include CurrentCart
  before_action :set_cart, only:[:new, :create, :index, :show]

  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if @cart.line_items.empty?
      redirect_to all_items_all_path, notice: "Your cart is empty!"
      return
    end
    @order = Order.new(user_id: current_user.id)

  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.add_line_items_form_cart(@cart)
    
    if @order.save
      #adding vendor_id to order
      vendor_order = @order.line_items.group_by{|line_item| line_item.item.vendor}.each {|vendor, line_items| vendor.vendor_orders.create(order: @order, line_items: line_items)}
      
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to user_orders_path(current_user), notice: "Thank you for placing the order."
    else
      flash[:error] = "Error placing the order. Please try again."
      render :new
    end
  end


 

  def destroy
    @order = Order.find(params[:id])
    
     if @order.destroy
       flash[:notice] = "Order was deleted successfully."
       redirect_to user_orders_path(current_user)
     else
       flash[:error] = "There was an error deleting the order."
       render :index
     end
  end

  private

  def order_params
    params.require(:order).permit(:vendor_id, :user_id, :line_item_id)
  end

end