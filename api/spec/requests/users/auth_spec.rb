# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth Requests', type: :request do
  include ApiSupport

  describe 'POST /users' do
    let(:register_url) { '/signup' }
    email = 'picard@gmail.com'
    let(:valid_user_params) do
      {
        user: {
          first_name: 'Jean Luc',
          last_name: 'Picard',
          username: 'Captain Picard',
          email: email,
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    let(:login_url) { '/login' }
    let(:user) { create :user, confirmed_at: DateTime.now }
    let(:user2) { create :user }
    let(:valid_sign_in) do
      {
        user: { 
          email: user.email,
          password: user.password
        }
      }
    end
    let(:invalid_sign_in) do
      {
        user: { 
          email: user2.email,
          password: user2.password
        }
      }
    end

    let(:invalid_user_params) do
      {
        first_name: 'Jean Luc',
        last_name: 'Picard',
        username: 'Captain Picard',
        email: email,
        password: 'password',
        password_confirmation: 'passwordd'
      }
    end

    context 'registration is successful' do
      before do
        expect do
          post register_url, params: valid_user_params
          Sidekiq::Worker.drain_all
        end.to change { ActionMailer::Base.deliveries.size }.by(1)
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns last user' do
        expect(response.body).to include(User.last.id.to_json)
        expect(response.body).to include(email.to_json)
      end
    end

    context 'registration is unsuccessful' do
      it 'returns 503' do
        post register_url, params: invalid_user_params
        expect(response).to have_http_status(503)
      end
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

    context 'user is not confirmed' do
      it 'returns 403' do
        post login_url, params: invalid_sign_in
        expect(response).to have_http_status(403)
      end

      it 'can confirm and sign in' do
        user2.confirm
        post login_url, params: invalid_sign_in
        expect(response).to have_http_status(200)
      end
    end

    context 'login is unsuccessful' do
      it 'returns 401' do
        post login_url, params: { user: {
          email: user.email,
          password: ''
        }}
        expect(response).to have_http_status(401)
      end
    end
  end
end
