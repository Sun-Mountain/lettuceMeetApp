# frozen_string_literal: true

require 'jwt'
# To do: read up on library and see if token is being signed during encode call and if signature is being checked
module JwtToken
  extend ActiveSupport::Concern
  SECRET_KEY = ENV['DEVISE_JWT_SECRET_KEY']
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
