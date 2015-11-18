class OrderItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :update, :destroy]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def index
    @order_items = OrderItem.all
  end

  def create
    item = Item.find(params[:item_id])
    @ordered_item = @cart.order_items.build(item: item)

    respond_to do |format|
      if @ordered_item.save
        format.html { redirect_to @ordered_item.cart notice: 'Order item was created.' }
        format.json { render action: 'show', status: :created, location: @ordered_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end
end
