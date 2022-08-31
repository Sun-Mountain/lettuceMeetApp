# frozen_string_literal: true

module NavHelper
  def current_admin_page
    'current_admin_page'
  end

  def admin_dashboard?
    current_page?('/admin')
  end

  def admin_user_page?
    current_page?('/admin/users')
  end

  def admin_event_page?
    current_page?('/admin/events')
  end
end
