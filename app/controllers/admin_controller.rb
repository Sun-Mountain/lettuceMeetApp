# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'
  before_action :authorize_admin

  def index
    @admin = current_user
    @events = Event.all
    @users = User.all
  end

  def show
  end

  def users
    @admin = current_user
    @users = User.all
  end

  def events
    @events = Event.all
  end

  def authorization
    @admin = current_user
    @user = User.find(auth_params[:id])

    if !user_authorized(@user)
      authorize_user(@user)
    elsif user_authorized(@user)
      deauthorize_user(@user)
    else
      flash[:alert] = "Something went wrong. Please try again later."
    end

    redirect_to admin_users_path(@admin)
  end

  private
  def auth_params
    params.require(:user).permit(:id)
  end

  def authorize_user(u)
    u.authorized = true
    if u.save
      flash[:notice] = "#{u.name} is now Authorized."
    else
      flash[:alert] = "#{u.name} could not be Authorized."
    end
  end

  def deauthorize_user(u)
    u.authorized = false
    if u.save
      flash[:notice] = "#{u.name} is now Unauthorized."
    else
      flash[:alert] = "#{u.name} could not be Unauthorized."
    end
  end

  def user_authorized(u)
    u.authorized
  end
end
