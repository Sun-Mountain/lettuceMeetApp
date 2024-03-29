# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_user
  before_action :find_event, only: %i[show update destroy]

  def index
    return render json: { err: @event.errors.full_messages }, status: 401 unless @user.admin
    @events = Event.all.where('start_date >= ?', Date.today())
    render json: @events, status: 201
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
    @public_events = Event.all.where(private: false).order(start_date: :asc).partition { |e| e.start_date < Date.today() }
    render json: { past: @public_events[0], upcoming: @public_events[1] }, status: 201
  end

  def user_owned
    @events = Event.all.where(user_id: @user.id).order(start_date: :asc).partition { |e| e.start_date < Date.today() }
    render json: { past: @events[0], upcoming: @events[1] }, status: 201
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :description, :private, :all_day, :start_date, :end_date, :start_time, :end_time, :user_id, :uid, :created_at)
  end

  def find_event
    @event = Event.find_by(uid: params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end