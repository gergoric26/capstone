class PagesController < ApplicationController
  
  before_action :authenticate_user!

  def vendor
    @vendors = Vendor.all
  end
end
