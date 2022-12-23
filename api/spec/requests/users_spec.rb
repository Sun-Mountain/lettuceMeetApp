# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    email = 'picard@gmail.com'
    let(:url) { '/users' }
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
        post url, params: valid_user_params
      end

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns last user' do
        expect(response.body).to include(User.last.id.to_json)
        expect(response.body).to include(email.to_json)
      end
    end

    # context 'login is successful' do
    #   let(:user)
    # end
  end
end
