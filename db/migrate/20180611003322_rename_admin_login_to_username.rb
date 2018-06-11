class RenameAdminLoginToUsername < ActiveRecord::Migration[5.2]
  def change
    rename_column :admins, :login, :username
  end
end
