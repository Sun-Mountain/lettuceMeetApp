# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password
  has_many :events

  validates :firstName, :lastName, :preferredUsername, :email, :password, :password_confirmation, presence: true, on: :create
  validates :preferredUsername, :email, uniqueness: true
end
