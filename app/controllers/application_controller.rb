class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  ####################################################################################################
  #
  # Admin
  #
  ####################################################################################################

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id])
  end
  helper_method :current_admin

  def require_admin
    unless current_admin
      flash[:notice] = "You have to log in."
      session[:admin_requested_url] = request.url unless request.xhr?
      session[:admin_id] = nil
      redirect_to admin_login_path and return false
    end
  end
  
end
