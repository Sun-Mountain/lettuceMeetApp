# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    let(:register_url) { '/users' }

    email = 'picard@gmail.com'
    let(:valid_user_params) do
      {
        first_name: 'Jean Luc',
        last_name: 'Picard',
        user_name: 'Captain Picard',
        email: email,
        password: 'password',
        password_confirmation: 'password'
      }
    end

    let(:login_url) { '/auth/login' }
    let!(:user) { create :user }
    let(:valid_sign_in) do
      {
        email: user.email,
        password: user.password
      }
    end

    let(:invalid_user_params) do
      {
        first_name: 'Jean Luc',
        last_name: 'Picard',
        user_name: 'Captain Picard',
        email: email,
        password: 'password',
        password_confirmation: 'passwordd'
      }
    end

    context 'registration is successful' do
      before do
        post register_url, params: valid_user_params
      end

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns last user' do
        expect(response.body).to include(User.last.id.to_json)
        expect(response.body).to include(email.to_json)
      end
    end

    context 'login is successful' do
      before do
        post login_url, params: valid_sign_in
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns last user' do
        user_email = user.email
        expect(response.body).to include(User.last.id.to_json)
        expect(response.body).to include(user_email.to_json)
      end

      it 'returns with valid JWT' do
        token = JSON.parse(response.body)['token']
        expect { JwtToken.decode(token) }.to_not raise_error
      end
    end

    context 'registration is unsuccessful' do
      it 'returns 503' do
        post register_url, params: invalid_user_params
        expect(response).to have_http_status(503)
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
