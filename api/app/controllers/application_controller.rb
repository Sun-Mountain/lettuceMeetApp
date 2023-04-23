# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user|
  #     user.permit(
  #       :email, :first_name, :last_name, :preferred_username,
  #       :password, :password_confirmation, :current_password
  #     )
  #   end

  #   devise_parameter_sanitizer.permit(:account_update) do |user|
  #     user.permit(
  #       :email, :first_name, :last_name, :preferred_username,
  #       :password, :password_confirmation, :current_password
  #     )
  #   end
  # end
end
