class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  USERNAME_REGEX = /\A[a-zA-Z0-9]*\z/
  PASSWORD_PATTERN = /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@#$%^&+=]).{6,}\z/


  validates :username, :email, :password, presence: true
  validates_confirmation_of :password
  validates :username, uniqueness: { case_sensitive: false }, format: { with: USERNAME_REGEX }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, uniqueness: { case_sensitive: false }, format: { with: PASSWORD_PATTERN }

end
