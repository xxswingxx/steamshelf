class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied, with: :access_denied
  
  def after_sign_in_path_for(resource)
    user_games_url(current_user)
  end

  def access_denied(exception)
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end
end
