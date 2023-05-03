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
      'email': user.email,
      'current_password': user.password
    }
  end
  
  let(:wrong_password) do
    {
      'id': user.id,
      'first_name': 'Jean Luc',
      'last_name': 'Picard',
      'preferred_username': 'Captain Picard',
      'email': user.email,
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
    end

    context 'is unsuccessful' do
      before do
        @before = user
        @after = user
        put users_url, headers: authenticated_header(user), params: wrong_password.to_json
      end

      it 'returns 401 with wrong password' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
