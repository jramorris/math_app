class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def require_user
    unless current_user
    	redirect_to login_path
      flash[:alert] = "You must be logged in to access that feature"
    end
  end
end
