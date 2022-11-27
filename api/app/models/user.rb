# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :todos

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }
end
