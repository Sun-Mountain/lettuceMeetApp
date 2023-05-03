# frozen_string_literal: true

module ApiSupport
  def authenticated_header(user)
    token = JwtToken.encode(payload: { sub: user.id })
    { "CONTENT_TYPE": "application/json", "Authorization": "Bearer #{token}" }
  end

  def extract_token(response)
    header = response.headers['Authorization'].split(' ').last
    decoded_token = JwtToken.decode(header)
    decoded_token['sub']
  end
end