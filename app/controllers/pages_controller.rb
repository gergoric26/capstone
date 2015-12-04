class PagesController < ApplicationController
  
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart

  def vendor
    @vendors = Vendor.all
  end
end
