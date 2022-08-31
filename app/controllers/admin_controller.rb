# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'
  before_action :authorize_admin

  def index
    @admin = current_user
    @adminId = current_user.id
    @events = Event.all
    @users = User.all
  end

  def show
  end

  def users
    @users = User.all
  end

  def events
    @events = Event.all
  end

  def create_delete_admin(user)
  end
end
