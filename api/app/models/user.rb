# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :first_name, :last_name, :preferred_username, :email, :password, :password_confirmation, presence: true, on: :create
  validates :preferred_username, :email, uniqueness: true
end
