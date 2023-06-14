# frozen_string_literal: true

# require './lib/redis_store/mail_throttle_store'

class ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_user
  before_action :token
  respond_to :json

  def create
    return render json: { status: 403, message: 'There was an issue.' }, status: :forbidden unless find_user_by_token
    if @user.confirm
      render json: { status: 201 }, status: :ok
    else
      render json: { err: @event.errors.full_messages }, status: 503
    end
  end

  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
  end

  def confirmation_params
    params.require(:confirmation).permit(:token)
  end

  def token
    @token = confirmation_params[:token]
  end

  def find_user_by_token
    @user = User.find_by_confirmation_token(@token)
  end
end