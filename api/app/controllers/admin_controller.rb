# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :confirm_admin

  def show
    @users = User.all
    @events = Event.all
    @split = Event.all.partition { |e| e.start_date < Date.today() }
    render json: { users: @users.count, events: { all: @events.count, past: @split[0].count, upcoming: @split[1].count }}, status: 201
  end

  private

  def admin_params
    params.require(:admin_req).permit(:admin_id)
  end

  def confirm_admin
    @user = User.find(params[:id])

    return @user.admin
  end
end
