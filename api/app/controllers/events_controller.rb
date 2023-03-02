# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_user

  def index
    @user = User.find(params[:user_id])
    @events = @user.events.order(start_date: :desc)
    puts @events
    render json: @events, status: 201
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
    else
      render json: { err: @event.errors.full_messages }, status: 503
    end
  end

  def show
    @event = Event.find_by(uid: params[:id])
    render json: @event, status: 201
  end

  private

  def event_params
    params.permit(:title, :body, :private, :all_day, :start_date, :end_date, :start_time, :end_time, :user_id, :uid, :created_at)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
