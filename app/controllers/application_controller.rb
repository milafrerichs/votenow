class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  def sign_in user
    session[:current_user_id] = user.id || raise(ArgumentError, 'Wanna sign in nil?')
  end

  def sign_out
    session.delete(:current_user_id)
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def require_user
    redirect_to login_path unless signed_in?
  end

  helper_method :current_user, :signed_in?
end
