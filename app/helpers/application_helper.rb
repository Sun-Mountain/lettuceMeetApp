# frozen_string_literal: true

module ApplicationHelper
  private

  def user_admin?
    current_user.admin?
  end

  def user_authorized?
    current_user.authorized? || current_user.admin? if current_user.present?
  end
end
