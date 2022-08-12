# frozen_string_literal: true

module ApplicationHelper
  private
  def user_admin?
    current_user.admin?
  end

  def user_authorized?
    unless !current_user.present?
      current_user.authorized? || current_user.admin?
    end
  end
end
