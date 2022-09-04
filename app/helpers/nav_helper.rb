# frozen_string_literal: true

module NavHelper
  def current_nav_page
    'current_nav_page'
  end

  def home?
    current_page?(root_path)
  end

  def edit_profile?
    current_page?(edit_registration_url(User))
  end

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
