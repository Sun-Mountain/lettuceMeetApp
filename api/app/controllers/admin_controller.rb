# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :confirm_admin

  def app_stats
    @users = User.all
    @events = Event.all
    @split = Event.all.partition { |e| e.start_date < Date.today() }
    render json: { users: @users.count, events: { all: @events.count, past: @split[0], upcoming: @split[1] }}, status: 201
  end

  private

  def admin_params
    params.require(:admin_req).permit(:id, :admin)
  end

  def confirm_admin
    @user = User.find(params[:id])

    return @user.admin
  end
end
