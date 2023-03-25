# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Event Requests', type: :request do
  let(:login_url) { '/auth/login' }
  let!(:user) { create :user }
  let!(:valid_sign_in) do
    {
      email: user.email,
      password: user.password
    }
  end

  before(:each) do
    post login_url, params: valid_sign_in
    @token = JSON.parse(response.body)['token']
  end

  describe 'POST /events' do
    let!(:events_url) { "/users/#{user.id}/events" }

    context 'is successful' do
      before do
        post events_url,
          params: {'eventTitle': 'This is a new title', 'startDate': Date.today() + 1.day },
          headers: { 'Authorization': @token }
      end
  
      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'is not successful' do
      before do
        post events_url,
          params: {'eventTitle': '', 'startDate': '' },
          headers: { 'Authorization': @token }
      end
  
      it 'returns 503' do
        expect(response).to have_http_status(503)
      end
    end
  end
end
