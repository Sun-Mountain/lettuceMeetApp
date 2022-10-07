# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'

  def index
    @user = current_user
    return unless auth_admin(@user)

    @events = Event.all
    @users = User.all
  end

  def show; end

  def users
    @user = current_user
    @users = User.all.order('id ASC') if auth_admin(@user)
  end

  def events
    @user = current_user
    @events = Event.all if auth_admin(@user)
  end

  def administration; end

  def authorization; end

  private

  def auth_admin(user)
    return true if user.admin? || user.superadmin?

    flash[:alert] = 'Something went wrong. Please try again later.'
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
