class Admin < ActiveRecord::Base

  has_many :posts
  
  validates :name, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true
  has_secure_password
  
  # Hack Fix (strong_parameters + has_secure_password) see https://github.com/rails/rails/issues/9535
  # fixed at 8c1687bbf8dd518d64fc7180b33c1cb57f29a69a (unreleased)
  before_validation(on: :update) do
    # only want confirmation validation to run if user enters password
    self.password_confirmation = nil unless self.password.present?
  end
  
end
