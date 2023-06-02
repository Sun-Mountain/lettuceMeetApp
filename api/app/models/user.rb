# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  # has_secure_password
  has_many :events

  validates :first_name, :last_name, :preferred_username, :email, :password, presence: true, on: :create
  validates :first_name, :last_name, :preferred_username, :email, presence: true
  validates :email, uniqueness: true
end
