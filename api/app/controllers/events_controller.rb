class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:show, :update, :destroy]

  def index
    @events = Event.where(user_id: current_user.id)
    render json: @events, status: 200
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
    else
      render json: {err: @event.errors.full_messages}, status: 503
    end
  end

  def update
    unless @event.update(event_params)
      render json: {err: @event.errors.full_messages}, status: 503
    end
  end

  def destroy
    unless @event.destroy
      render json: {err: @user.errors.full_messages}, status: 503
    end
  end

  private

  def event_params
    params.permit(:id, :title, :body, :location, :public, :start_date, :end_date, :start_time, :end_time, :user_id)
  end

  def find_event
    @event = Event.find(params[:id]).where(user_id: current_user.id)
  end
end
