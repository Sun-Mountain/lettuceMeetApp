# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'

  def index
    @user = current_user
    if auth_admin(@user)
      @events = Event.all
      @users = User.all
    end
  end

  def show; end

  def users
    @user = current_user
    if auth_admin(@user)
      @users = User.all.order('id ASC')
    end
  end

  def events
    @user = current_user
    if auth_admin(@user)
      @events = Event.all
    end
  end

  def administration
  end

  def authorization
  end

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
