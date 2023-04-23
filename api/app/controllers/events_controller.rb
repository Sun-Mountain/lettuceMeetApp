# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_user
  before_action :find_event, only: %i[show update destroy]

  def index
    @events = Event.all.where(user_id: @user.id).order(startDate: :asc).partition { |e| e.startDate < Date.today() }
    render json: { past: @events[0], upcoming: @events[1] }, status: 201
  end

  def show
    render json: @event, status: 201
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
    return if @event&.update(event_params)

    render json: { err: @event.errors.full_messages }, status: 503
  end

  def destroy
    return if @event.destroy
    render json: { err: @event.errors.full_messages }, status: 503
  end

  def all_public
    @public_events = Event.all.where(private: false).order(startDate: :asc).partition { |e| e.startDate < Date.today() }
    render json: { past: @public_events[0], upcoming: @public_events[1] }, status: 201
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