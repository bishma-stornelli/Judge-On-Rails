class User < ActiveRecord::Base
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :password_digest, :username, :problems, :admin

  # Relationships with other entities
  has_many :marked_problems
  has_many :problems, through: :marked_problems
  
  # Validations for username
  validates :username, presence: true, uniqueness: true
  
  # Validations for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, confirmation: true, format: { with: VALID_EMAIL_REGEX }
  
  
  # Validations for password
  has_secure_password
  
  # auxilary methods
  def admin?
    self.admin
  end
end
