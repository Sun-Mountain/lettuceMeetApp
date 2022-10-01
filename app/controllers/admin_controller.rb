# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'

  def index
    @user = current_user
    @events = Event.all
    @users = User.all
  end

  def show; end

  def users
    @user = current_user
    @users = User.all.order('id ASC')
  end

  def events
    @user = current_user
    @events = Event.all
  end

  def administration
    @user = current_user
    @user = User.find(user_params[:id])

    if !user_admin(@user)
      admin_add(@user)
    elsif user_admin(@user)
      admin_remove(@user)
    else
      flash[:alert] = 'Something went wrong. Please try again later.'
    end

    redirect_to admin_users_path
  end

  def authorization
    @user = current_user
    @user = User.find(user_params[:id])

    if !user_authorized(@user)
      authorize_user(@user)
    elsif user_authorized(@user)
      deauthorize_user(@user)
    else
      flash[:alert] = 'Something went wrong. Please try again later.'
    end

    redirect_to admin_users_path
  end

  private

  def admin_add(user)
    user.admin = true
    user.authorized = true
    if user.save
      flash[:notice] = "#{user.name} is now an Administrator."
    else
      flash[:alert] = "#{user.name} could not be made an Administrator."
    end
  end

  def admin_remove(user)
    user.admin = false
    user.authorized = false
    if user.save
      flash[:notice] = "#{user.name} is no longer an Administrator."
    else
      flash[:alert] = "#{user.name} could not be removed as an Administrator."
    end
  end

  def authorize_user(user)
    user.authorized = true
    if user.save!
      flash[:notice] = "#{user.name} is now Authorized."
    else
      flash[:alert] = "#{user.name} could not be Authorized."
    end
  end

  def deauthorize_user(user)
    user.authorized = false
    if user.save
      flash[:notice] = "#{user.name} is now Unauthorized."
    else
      flash[:alert] = "#{user.name} could not be Unauthorized."
    end
  end

  def user_admin(user)
    user.admin
  end

  def user_authorized(user)
    user.authorized
  end

  def user_params
    params.require(:user).permit(:id)
  end
end
