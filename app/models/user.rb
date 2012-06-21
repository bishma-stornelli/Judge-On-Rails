class User < ActiveRecord::Base
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :password_digest, :username

  
  # Validations for username
  validates :username, presence: true, uniqueness: true
  
  # Validations for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, confirmation: true, format: { with: VALID_EMAIL_REGEX }
  
  # Validations for password
  has_secure_password
end
