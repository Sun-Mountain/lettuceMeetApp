# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :trackable, :confirmable, :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  # has_secure_password
  has_many :events

  validates :email, :password, presence: true, on: :create
  validates :email, uniqueness: true
end
