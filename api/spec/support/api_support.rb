# frozen_string_literal: true

module ApiSupport
  def authenticated_header(request, user)
    auth_headers = Devise::JWT::TestHelpers.auth_headers(request, user)
    request.headers.merge!(auth_headers)
  end
end