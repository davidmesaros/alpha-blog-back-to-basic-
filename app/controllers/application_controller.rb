class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?# [method] => need to return true or false only
  !!current_user# return current _user => ie  true/false or nil
  end

  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged into perform that action"
      redirect_to root_path
    end
  end
end
