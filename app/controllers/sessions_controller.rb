class SessionsController < ApplicationController
  skip_before_filter :require_login

  def home

  end

  def login

  end

  def login_attempt
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to contacts_path, notice: 'Your logged in'
    else
      respond_to do |format1|
        format1.html{
          flash[:error] = 'Invalid username or password'
          render :login
        }
      end
    end
  end

  def logout
    if session[:user_id] || session[:user_id] == nil
      session[:user_id] = nil
      respond_to do |format1|
        format1.html{
          flash[:notice] = nil
          flash[:alert] = 'You have successfully logged out'
          render :login
        }
      end
    end
  end
end
