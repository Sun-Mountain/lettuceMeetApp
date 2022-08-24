# frozen_string_literal: true

class PublicController < ApplicationController
  before_action :authenticate_user!

  def landing
    @user = User.find(user_id)
    @events = @user.events
  end

  private

  def user_id
    current_user.id
  end
end
