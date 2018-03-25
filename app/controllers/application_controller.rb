class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:path] = request.fullpath
      redirect_to login_path, alert: 'Are you Guru? Verify your email and password please!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
