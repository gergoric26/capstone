class AllItemsController < ApplicationController
  def all
    @items = Item.all
  end
end
