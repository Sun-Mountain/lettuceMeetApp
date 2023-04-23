# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name])
  end

  private

  def deny_content_type_json
    return unless request.content_type == 'application/json'

    render json: {
      status: 403,
      message: 'No body allowed in this request'
    }, status: :forbidden
  end
end
