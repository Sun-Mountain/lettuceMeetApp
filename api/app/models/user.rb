class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :user_name, :email, :password, :password_confirmation, presence: true
  validates :user_name, :email, uniqueness: true
end
