# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(
        :first_name, :last_name, :username,
        :email, :password, :password_confirmation, :current_password, :admin
      )
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :first_name, :last_name, :username,
        :email, :password, :password_confirmation
      )
    end
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JwtToken.decode(header)
      return if current_user.id === @decoded[:sub]
    rescue ActiveRecord::RecordNotFound => e
      render json: { err: e.message }, status: 401
    rescue JWT::DecodeError => e
      render json: { err: e.message }, status: 401
    end
  end

  def authenticate_password(account_update_params)
    @user.valid_password?(account_update_params[:current_password])
  end

  def deny_content_type_json
    return unless request.content_type == 'application/json'

    render json: {
      status: 403,
      message: 'No body allowed in this request'
    }, status: :forbidden
  end
end
