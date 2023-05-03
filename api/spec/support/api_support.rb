# frozen_string_literal: true

module ApiSupport
  def authenticated_header(user)
    token = JwtToken.encode(payload: { sub: user.id })
    { "CONTENT_TYPE": "application/json", "Authorization": "Bearer #{token}" }
  end
end