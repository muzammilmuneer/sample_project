class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  check_authorization unless: :devise_controller?

  PER_PAGE_LIMIT = 5
  
  protected

  
  # def after_sign_out_path_for(resource)
  #   new_user_session_path # Or :prefix_to_your_route
  # end


  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = "You are not authorized to access this page"
    redirect_to root_path
  end

end
