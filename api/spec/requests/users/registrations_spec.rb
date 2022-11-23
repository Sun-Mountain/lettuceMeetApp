# frozen_string_literal: true

require 'rails_helper'

Rails.describe 'Registration Requests', type: :request do
  describe 'POST /users'do
    email = 'email@example.com'
    let(:url) { '/users' }
    let(:params) do
      {
        user: {
          email: email,
          password: 'password'
        }
      }
    end

    context 'when params are correct' do
      before do
        post url, params: params
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns last user' do
        expect(response.body).to include((User.last.id).to_json)
        expect(response.body).to include((email).to_json)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end
  end
end