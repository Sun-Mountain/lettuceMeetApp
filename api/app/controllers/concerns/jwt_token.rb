# frozen_string_literal: true

require 'jwt'

# Create JWT Token
module JwtToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  EXP = 7.days.from_now

  def self.encode(payload)
    payload[:exp] = 7.days.from_now.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
