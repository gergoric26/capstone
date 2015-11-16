class ItemsController < ApplicationController
  
  before_action :authenticate_vendor!

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @items = @vendor.items
  end

  def show
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.vendor = current_vendor
    authorize @item
    if @item.save
      redirect_to vendor_items_path(current_vendor), notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating Item. Please try again."
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)
    authorize @item
    if @item.save
      flash[:notice] = "Item was updated."
      redirect_to vendor_items_path(current_vendor)
    else
      flash[:error] = "There was an error updating the item. Please try again."
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
     if @item.destroy
       flash[:notice] = "\"#{@item.title}\" was deleted successfully."
       redirect_to vendor_items_path(current_vendor)
     else
       flash[:error] = "There was an error deleting the item."
       render :index
     end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :price, :vendor_id)
  end

end
