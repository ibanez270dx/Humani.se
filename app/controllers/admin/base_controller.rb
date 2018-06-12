class Admin::BaseController < ApplicationController
  before_action :require_admin, except: [:login]
  layout "admin"

  def login
    if request.post?
      if @admin = Admin.find_by_username(params[:admin][:username])
        if @admin.authenticate(params[:admin][:password])
          session[:admin_id] = @admin.id
          redirect_to session.delete(:admin_requested_url) || admin_root_path
        else
          flash.now[:error] = "Your password is incorrect."
        end
      else
        flash.now[:error] = "There is no admin with that username."
      end
    end
  end

  def logout
    session[:admin_id] = nil
    redirect_to admin_login_path
  end

private

  def admin_params
    params.require(:admin).permit(:name, :username, :password, :password_confirmation)
  end

end
