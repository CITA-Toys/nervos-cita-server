class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_action :auth_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  protected

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    @current_user = nil
    reset_session
    redirect_to root_path
  end

  def auth_login
    redirect_to root_path unless logged_in?
  end
end
