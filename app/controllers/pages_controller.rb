class PagesController < ApplicationController
  
  before_action :authenticate_vendor!

  def vendor
    @vendors = Vendor.all
  end
end
