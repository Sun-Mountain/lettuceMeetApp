# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user creates events' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'user creates an event' do
    scenario 'when successfull' do
      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      fill_in :event_title, with: 'My Event'
      fill_in :event_start_date, with: Date.today + 2.days
      fill_in :event_end_date, with: Date.today + 3.days
      fill_in :event_description, with: 'This is the description for my event.'

      find('[data-test="submit"]').click

      expect(page.body).to include('Event successfully created.')
      expect(page.body).to include(title)
    end

    scenario 'when unsuccessful' do
      start_date = Date.today + 2.days

      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      find('[data-test="submit"]').click

      expect(page.body).to include('Event could not be created.')

      fill_in :event_title, with: ''
      fill_in :event_start_date, with: start_date

      find('[data-test="submit"]').click

      expect(page.body).to include('Event could not be created.')
    end
  end
end
