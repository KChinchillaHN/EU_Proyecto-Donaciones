class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authenticate

  def login(user)
    session[:user_id] = user.id
    redirect_to campaigns_user_path(current_user)
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def authenticate
    unless current_user
        redirect_to login_path
    end
  end

end
