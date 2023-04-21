# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :events

  validates :firstName, :lastName, :preferredUsername, :email, :password, :password_confirmation, presence: true, on: :create
  validates :preferredUsername, :email, uniqueness: true
end
