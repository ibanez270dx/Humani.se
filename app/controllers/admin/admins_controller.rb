class Admin::AdminsController < ApplicationController
  before_filter :require_admin, except: [ :login ]
  layout "admin"

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.valid?
      flash[:success] = "Admin created successfully."
      redirect_to admin_admins_path
    else
      render action: 'new'
    end
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]
    logger.debug(admin_params)
    if @admin.update_attributes(admin_params)
      flash[:success] = "Admin updated successfully."
      redirect_to admin_admins_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @admin = Admin.find(params[:id]).destroy
    flash[:success] = "Admin destroyed successfully."
    redirect_to admin_admins_path
  end

  #############################
  # Authentication
  #############################

  def login
    if request.post?
      if @admin = Admin.find_by_username(params[:admin][:username])
        if @admin.authenticate(params[:admin][:password])
          session[:admin_id] = @admin.id
          redirect_to session[:admin_requested_url] || admin_admins_path
          session[:admin_requested_url] = nil
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
