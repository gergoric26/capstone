class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  include CurrentCart
  before_action :set_cart, only:[:edit, :update]

  def pundit_user
    current_user = current_vendor 
  end

  def after_sign_in_path(resource)
    if resource.is_a?(Vendor) 
      vendor_items_path(resource)
    end
  end

  def after_sign_in_path(resource)
    if resource.is_a?(User) 
      pages_vendor_path(resource)
    end
  end

  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate!
    unless current_vendor || current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :address, :state, :zipcode, :phone_number, :fax_number, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :address, :state, :zipcode, :phone_number, :fax_number, :password, :password_confirmation) }
  end
end
