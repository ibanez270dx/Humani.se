class Admin::AdminsController < ApplicationController
  
  def index
    @admins = Admin.all
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.create params[:admin]
    if @admin.save
      flash[:notice] = "Admin created successfully."
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
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Admin updated successfully."
      redirect_to admin_admins_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @admin = Admin.find(params[:id]).destroy
    flash[:notice] = "Admin destroyed successfully."
    redirect_to admin_admins_path
  end
  
  #############################
  # Authentication
  #############################
  
  def login
    @admin = Admin.find_by_login(params[:login])
    if @admin
      if @admin.authenticate(params[:password])
        session[:admin_id] = @admin.id
        redirect_to session[:admin_requested_url] || admin_admins_path
        session[:admin_requested_url] = nil
      else
        flash.now[:notice] = "Your password is incorrect."
      end
    else
      flash.now[:notice] = "There is no admin with that login."
    end
  end
  
  def logout
    session[:admin_id] = nil
    redirect_to admin_login_path
  end
  
end