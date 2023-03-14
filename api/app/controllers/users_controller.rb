# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :find_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { err: @user.errors.full_messages }, status: 503
    end
  end

  def update
    # binding.pry
    return if @user&.authenticate(params[:password]) && @user&.update(user_params)

    render json: { err: @user.errors.full_messages }, status: 503
  end

  def destroy
    return if @user&.authenticate(params[:password]) && @user&.destroy

    render json: { err: @user.errors.full_messages }, status: 503
  end

  private

  def user_params
    params.permit(:id, :firstName, :lastName, :preferredUsername, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
