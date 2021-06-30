class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true

end
