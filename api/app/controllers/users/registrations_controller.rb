# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: {code: 201, message: "Signed up sucessfully."},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == "PUT" && resource.persisted?
      account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
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
    elsif request.method == "DELETE"
      render json: {
        status: { code: 204, message: "Account deleted successfully."}
      }, status: :ok
    else
      render json: {
        status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: 503
    end
  end
end
