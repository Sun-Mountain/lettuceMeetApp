# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JwtToken

  # before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JwtToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { err: e.message }, status: unauthorized
    rescue JWT::DecodeError => e
      render json: { err: e.message }, status: unauthorized
    end
  end
end
