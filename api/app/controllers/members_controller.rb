# app/controllers/members_controller.rb
class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      message: "If you see this, you're in!",
      user: current_user
    }
  end
end