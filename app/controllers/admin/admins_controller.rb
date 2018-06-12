class Admin::AdminsController < Admin::BaseController

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
      render action: "new"
    end
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]

    if @admin.update_attributes(admin_params)
      flash[:success] = "Admin updated successfully."
      redirect_to admin_admins_path
    else
      render action: "edit"
    end
  end

  def destroy
    @admin = Admin.find(params[:id]).destroy
    flash[:success] = "Admin destroyed successfully."
    redirect_to admin_admins_path
  end

private

  def admin_params
    params.require(:admin).permit(:name, :username, :password, :password_confirmation)
  end

end
