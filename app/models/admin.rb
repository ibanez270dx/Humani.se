class Admin < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id

  validates :name, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_secure_password

end
