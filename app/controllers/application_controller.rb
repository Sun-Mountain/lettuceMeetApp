# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password, :role
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password, :role
      )
    end
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer || root_path
  end

  def render_not_found
    render file: "#{RAILS_ROOT}/public/404.html", status: 404
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
