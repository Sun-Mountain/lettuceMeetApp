# frozen_string_literal: true

# require './lib/redis_store/mail_throttle_store'

class ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_user
  before_action :token
  respond_to :json

  def create
    binding.pry
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(:token)
  end

  def token
    @token = confirmation_params[:token]
  end
end