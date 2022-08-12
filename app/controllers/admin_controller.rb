# frozen_string_literal: true

class AdminController < ApplicationController
  layout 'application'
  before_action :authorize_admin

  def index
    @admin = current_user
    @users = User.all
  end
end
