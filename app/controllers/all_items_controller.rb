class AllItemsController < ApplicationController

  include CurrentCart
  before_action :set_cart
  
  def all
    @items = Item.all
  end
end
