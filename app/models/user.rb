# email:string
# password_digest:string
# password:string               virtual
# password_confirmation:string  virtual
class User < ApplicationRecord
  # ruby on rails secure password method - encryption & authentication
  has_secure_password

  # REGEX code for validating emails
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex, message: "must be a valid email address"}
end
