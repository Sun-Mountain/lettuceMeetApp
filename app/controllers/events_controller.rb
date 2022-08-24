# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(user_id)
    @event = @user.events.new(events_params)
    binding.pry

    if @event.save
      flash[:notice] = 'Event created.'
    else
      flash[:alert] = 'Event could not be created.'
    end

    redirect_to root_path
  end

  private

  def events_params
    params.require(:event).permit(:title, :start_date, :end_date, :description, :user_id)
  end

  def user_id
    current_user.id
  end
end
