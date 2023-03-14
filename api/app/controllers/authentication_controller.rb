# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JwtToken.encode(user_id: @user.id)
      time = Time.now
      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     preferredUsername: @user.preferredUsername, email: @user.email, id: @user.id,
                     firstName: @user.firstName, lastName: @user.lastName },
             status: :ok
    else
      render json: { err: 'unauthorized' }, status: :unauthorized
    end
  end
end
