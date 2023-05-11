# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user
  respond_to :json

  private

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  def delete_response
    render json: {
      status: { code: 204, message: "Account deleted successfully."}
    }, status: :ok
  end

  def register_user(resource)
    render json: {
      status: {code: 201, message: "Signed up sucessfully."},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      register_user(resource)
    elsif request.method == "PUT" && resource.persisted?
      update_user(resource)
    else
      render json: {
        status: {code: 422, message: "Could not complete action. #{resource.errors.full_messages.to_sentence}"}
      }, status: 503
    end
  end

  def update_user(resource)
    if authenticate_password(account_update_params) && @user&.update(account_update_params.except("current_password"))
      render json: {
        status: {code: 200, message: "Account updated successfully."},
        data: UserSerializer.new(@user).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif !authenticate_password
      render json: { err: @user.errors.full_messages }, status: 401
    else
      render json: { err: @user.errors.full_messages }, status: 503
    end
  end
end
