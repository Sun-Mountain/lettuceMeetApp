# frozen_string_literal: true

class AdminController < ActionController::Base
  layout "application"
  before_action :authorize_admin

  private

  def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless current_user.admin?
  end
end
