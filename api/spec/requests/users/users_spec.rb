# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Requests', type: :request do
  include ApiSupport

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
  
  let(:valid_changes) do
    {
      'id': user.id,
      'first_name': 'Jean Luc',
      'last_name': 'Picard',
      'preferred_username': 'Captain Picard',
      'email': 'picard@gmail.com',
      'current_password': user.password
    }
  end
  
  let(:invalid_changes) do
    {
      'id': user.id,
      'first_name': '',
      'last_name': '',
      'preferred_username': '',
      'email': 'picard@gmail.com',
      'current_password': user.password
    }
  end
  
  let(:wrong_password) do
    {
      'id': user.id,
      'first_name': 'Jean Luc',
      'last_name': 'Picard',
      'preferred_username': 'Captain Picard',
      'email': 'picard@gmail.com',
      'current_password': 'wrongpassword'
    }
  end

  let(:users_url) { "/users/#{user.id}" }

  before(:each) do
    post login_url, params: valid_sign_in
  end

  describe 'PUT /user' do
    context 'is successful' do
      before do
        @before = user
        @after = user
        put users_url, headers: authenticated_header(user), params: valid_changes.to_json
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns changed user information' do
        expect(response.body).to include(user.id.to_json)
        # Changes first name
        expect(response.body).not_to include(user.first_name.to_json)
        expect(response.body).to include(valid_changes[:first_name])
        # Changes last name
        expect(response.body).not_to include(user.last_name.to_json)
        expect(response.body).to include(valid_changes[:last_name])
        # Changes username
        expect(response.body).not_to include(user.preferred_username.to_json)
        expect(response.body).to include(valid_changes[:preferred_username])
        # Changes email
        expect(response.body).not_to include(user.email.to_json)
        expect(response.body).to include(valid_changes[:email])
      end
    end

    context 'is unsuccessful' do
      it 'returns 401 with wrong password' do
        put users_url, headers: authenticated_header(user), params: wrong_password.to_json
        expect(response).to have_http_status(401)
      end
    end
  end
end
