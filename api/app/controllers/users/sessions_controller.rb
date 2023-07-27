# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :find_user
  before_action :confirm_user
  skip_before_action :authenticate_user
  respond_to :json

  private

  def confirm_user
    return render json: { status: 403, message: 'You have to confirm your email address before continuing.' }, status: :forbidden unless @user.confirmed?
  end

  def find_user
    @user = User.find_by_email(session_params[:email])
  end

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in sucessfully.'},
      body: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
