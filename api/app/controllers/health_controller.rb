class HealthController < ApplicationController
  def index
    render json: { status: 'online' }, status: 200
  end
end
