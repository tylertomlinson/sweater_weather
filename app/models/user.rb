class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, confirmation: { case_sensitive: true }
  has_secure_password
  has_secure_token :api_key
end
