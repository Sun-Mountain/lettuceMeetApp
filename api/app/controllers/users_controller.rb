# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show update destroy]
  # before_action :authenticate_user!
  before_action :deny_content_type_json, only: [:show]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: { user: @user }, status: :ok
  end

  def update
    if authenticate_password && @user&.update(user_params)
      render json: {
        status: {code: 200, message: "Account updated successfully."},
        data: UserSerializer.new(@user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: { err: @user.errors.full_messages }, status: 503
    end
  end

  def destroy
    return if @user&.authenticate(params[:password]) && @user&.destroy

    render json: { err: @user.errors.full_messages }, status: 503
  end

  private

  def authenticate_password
    @user.valid_password?(params[:current_password])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :email, :first_name, :last_name, :preferred_username, :password, :password_confirmation)
  end
end
