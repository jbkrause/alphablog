class ApplicationController < ActionController::Base

  # makes methods available to views
  helper_method :current_user, :logged_in?
  
  def current_user
    # avoids hitting database if already set
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def requires_user
    if !logged_in?
      flash[:danger] = "you must be logged in for that action"
      redirect_to root_path
    end
  end
  
end
