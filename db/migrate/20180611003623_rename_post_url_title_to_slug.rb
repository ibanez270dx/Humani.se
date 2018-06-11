class RenamePostUrlTitleToSlug < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :url_title, :slug
  end
end
