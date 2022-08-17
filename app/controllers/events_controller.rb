# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @event = Event.new
  end

  def create
  end
end
