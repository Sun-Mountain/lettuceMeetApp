# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_user
  before_action :find_event, only: %i[show update destroy]

  def index
    @events = @user.events.order(startDate: :asc)
    render json: @events, status: 201
  end

  def show
    if @event
      render json: @event, status: 201
    else
      render json: { err: @event.errors.full_messages }, status: 503
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
    else
      render json: { err: @event.errors.full_messages }, status: 503
    end
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.permit(:eventTitle, :description, :private, :allDay, :startDate, :endDate, :startTime, :endTime, :user_id, :uid, :created_at)
  end

  def find_event
    @event = Event.find_by(uid: params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end