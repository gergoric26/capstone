class ItemsController < ApplicationController
  
  before_action :authenticate_vendor!

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.vendor = current_vendor

    if @item.save
      redirect_to items_index_path, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating Item. Please try again."
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)
    if @item.save
      flash[:notice] = "Item was updated."
      redirect_to items_index_path
    else
      flash[:error] = "There was an error updating the item. Please try again."
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:picture, :title, :description, :price)
  end

end
