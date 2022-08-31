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
    binding.pry
  end
end
