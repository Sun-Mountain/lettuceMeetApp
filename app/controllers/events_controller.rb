# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @user = User.find(user_id)
    @events = Event.where(user_id: @user.id).or(Event.where(public: true))
  end

  def new
    @event = Event.new
  end

  def create
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Event
      @user = User.find(user_id)
      @event = @user.events.new(events_params)

      if @event.save
        flash[:notice] = 'Event successfully created.'
        redirect_to event_path(@event.id)
      else
        flash[:alert] = 'Event could not be created.'
        redirect_to new_event_path
      end
    end
  end

  def show
    @event = Event.find(event_id_param)
  end

  def edit
    @event = Event.find(event_id_param)
  end

  def update
    @event = Event.find(event_id_param)

    if @event.update(events_params)
      flash[:notice] = 'Event successfully updated.'
      redirect_to event_path(@event.id)
    else
      flash[:alert] = 'Event could not be updated.'
      redirect_to edit_event_path(@event.id)
    end
  end

  def destroy
    @event = Event.find(event_id_param)

    if @event.destroy
      flash[:notice] = 'Event successfully deleted.'
      redirect_to root_path
    else
      flash[:alert] = 'Event could not be deleted.'
      redirect_to event_path(@event.id)
    end
  end

  private

  def events_params
    params.require(:event).permit(:title, :start_date, :end_date, :description, :user_id)
  end

  def event_id_param
    params.require(:id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def user_id
    current_user.id
  end
end
