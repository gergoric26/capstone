class HomeController < ApplicationController

  before_action :home_page

  def index
  end

  private

  def home_page
    redirect_to vendor_items_path(current_vendor) if current_vendor
  end
end
