class AddAttributesToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.text :abstract
      t.boolean :enabled, default: false
      t.string :url_title
      t.string :meta_description
      t.string :meta_keywords
      t.string :filepicker_url
    end
  end
end
