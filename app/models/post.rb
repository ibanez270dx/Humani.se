class Post < ActiveRecord::Base

  belongs_to :author, foreign_key: :admin

end
