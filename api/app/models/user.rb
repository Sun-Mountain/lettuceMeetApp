# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :firstName, :lastName, :preferredUsername, :email, :password, :password_confirmation, presence: true, on: :create
  validates :preferredUsername, :email, uniqueness: true
end
