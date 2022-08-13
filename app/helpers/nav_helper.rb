# frozen_string_literal: true

module NavHelper
  def current_admin_page
    'current_admin_page'
  end

  def admin_dashboard?
    current_page?('/admin')
  end
end
