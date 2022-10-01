# frozen_string_literal: true

class PublicController < ApplicationController
  before_action :authenticate_user!

  def landing
    @user = User.find(user_id)
    unless @user.admin?
      @events = Event.where(user_id: @user.id).or(Event.where(public: true))
    else
      @events = Event.all
    end
  end

  private

  def user_admin?
    return current_user.role == 'admin' || current_user.role == 'superadmin'
  end

  def user_id
    current_user.id
  end
end
