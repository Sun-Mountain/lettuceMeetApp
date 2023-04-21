# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Event Requests', type: :request do
  let(:login_url) { '/auth/login' }
  let(:user) { create :user }
  let!(:valid_sign_in) do
    {
      email: user.email,
      password: user.password
    }
  end

  let!(:events_url) { "/users/#{user.id}/events" }

  before(:each) do
    post login_url, params: valid_sign_in
    @token = JSON.parse(response.body)['token']
  end

  describe 'POST /events' do
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

  describe 'GET /events' do
    before do
      event1 = create(:event, user_id: user.id)
      event2 = create(:event, user_id: user.id)
      user.events << [event1, event2]

      get events_url, headers: { 'Authorization': @token }
    end

    context 'is successful' do
      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /events/:id' do
    before do
      event3 = create(:event, user_id: user.id)
      user.events << [event3]
      events_id_url = "/users/#{user.id}/events/#{event3.uid}"

      get events_id_url, headers: { 'Authorization': @token }
    end

    context 'is successful' do
      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /events/:id' do
    context 'is successful' do
      before do
        event4 = create(:event, user_id: user.id)
        user.events << [event4]
        update_event_url = "/users/#{user.id}/events/#{event4.uid}"

        put update_event_url,
          params: {'eventTitle': 'This is a new title', 'startDate': Date.today() + 3.days },
          headers: { 'Authorization': @token }
      end

      it 'returns 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'is not successful' do
      before do
        event5 = create(:event, user_id: user.id)
        user.events << [event5]
        update_event_url = "/users/#{user.id}/events/#{event5.uid}"

        put update_event_url,
          params: {'eventTitle': '', 'startDate': '' },
          headers: { 'Authorization': @token }
      end

      it 'returns 503' do
        expect(response).to have_http_status(503)
      end
    end
  end

  describe 'GET /all_public' do
    before do
      events_id_url = "/users/#{user.id}/all_public"

      get events_id_url, headers: { 'Authorization': @token }
    end

    context 'is successful' do
      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'DELETE /events/:id' do
    context 'is successful' do
      before do
        event6 = create(:event, user_id: user.id)
        user.events << [event6]
        events_id_url = "/users/#{user.id}/events/#{event6.uid}"
  
        delete events_id_url, headers: { 'Authorization': @token }
      end
  
      it 'returns 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
