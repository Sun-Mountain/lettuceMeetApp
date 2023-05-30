# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration Requests', type: :request do
  include ApiSupport

  let(:register_url) { '/signup' }

  describe 'POST /signup' do
    email = 'picard@gmail.com'

    let(:valid_user_params) do
      {
        user: {
          first_name: 'Jean Luc',
          last_name: 'Picard',
          preferred_username: 'Captain Picard',
          email: email,
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    let(:invalid_user_params) do
      {
        first_name: 'Jean Luc',
        last_name: 'Picard',
        preferred_username: 'Captain Picard',
        email: email,
        password: 'password',
        password_confirmation: 'passwordd'
      }
    end

    context 'registration is successful' do
      before do
        post register_url, params: valid_user_params
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
  end

  # describe 'PUT /signup' do
  #   let(:user) { create :user }
  #   let(:login_url) { '/login' }

  #   let(:valid_sign_in) do
  #     {
  #       user: { 
  #         email: user.email,
  #         password: user.password
  #       }
  #     }
  #   end

  #   let(:valid_user_params) do
  #     {
  #       user: {
  #         first_name: 'Jean Luc',
  #         last_name: 'Picard',
  #         preferred_username: 'Captain Picard',
  #         email: user.email,
  #         current_password: user.password
  #       }
  #     }
  #   end

  #   context 'update account is successful' do
  #     before do
  #       post login_url, params: valid_sign_in
  #       token = extract_token(response)
  #       put register_url, headers: { "CONTENT_TYPE": "application/json", "Authorization": "Bearer #{token}" }, params: valid_user_params.to_json
  #     end

  #     it 'returns 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end
  # end
end
