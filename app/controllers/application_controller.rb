# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password
      )
    end
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer || root_path
  end
end
