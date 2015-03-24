class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :url_title, unique: true
    add_index :posts, :published_at, order: { published_at: :desc }
  end
end
