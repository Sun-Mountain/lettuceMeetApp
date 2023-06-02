# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login Requests', type: :request do
  include ApiSupport

  describe 'POST /login' do
    let(:login_url) { '/login' }

    let(:user) { create :user }

    let(:valid_sign_in) do
      {
        user: { 
          email: user.email,
          password: user.password
        }
      }
    end

    context 'login is successful' do
      before do
        post login_url, params: valid_sign_in
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns valid JTW token' do
        token = extract_token(response)
        expect(token).to be_present
      end

      it 'returns last user' do
        user_email = user.email
        expect(response.body).to include(User.last.id.to_json)
        expect(response.body).to include(user_email.to_json)
      end
    end

    context 'login is unsuccessful' do
      it 'returns 401' do
        post login_url, params: {
          email: user.email,
          password: ''
        }
        expect(response).to have_http_status(401)
      end
    end
  end
end