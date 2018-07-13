class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    return true if session[:session_token]
    false
  end

  def current_user
    return nil unless session[:session_token]
    @current_user = User.find_by(session_token: session[:session_token])
  end
end
