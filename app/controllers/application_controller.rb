class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  
  def current_user
    if session[:user_id]
    @current_user ||= User.find( session[:user_id] )
    end
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path and return false # halts request cycle
    end

  end
  
end 
