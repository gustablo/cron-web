class User < ApplicationRecord
  has_secure_password

  before_save { self.email = email.downcase }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: { case_sensitive: false }
end
