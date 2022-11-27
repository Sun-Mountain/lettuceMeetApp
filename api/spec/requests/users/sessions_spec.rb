# frozen_string_literal: true

require 'rails_helper'

Rails.describe 'Session Requests', type: :request do
  describe 'POST /api/users/sign_in'do
    let(:user) { create(:user) }
    let(:url) { '/api/users/sign_in' }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
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

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end
  end
end