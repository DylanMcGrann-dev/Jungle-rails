class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }
  before_save do
    self.email.downcase.strip if self.email
  end
  
  def self.authenticate_with_credentials(email,password)
    
    user = self.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else 
      nil
    end
  end

end
