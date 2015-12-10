class HomeController < ApplicationController

  layout 'home'

  before_action :home_page

  def index
  end

  private

  def home_page
    redirect_to vendor_items_path(current_vendor) if current_vendor
    redirect_to pages_vendor_path(current_user) if current_user
  end
end
