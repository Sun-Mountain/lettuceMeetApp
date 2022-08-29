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
      title = 'My Event'
      startTime = Date.today + 2.days
      endTime = Date.today + 3.days
      description = 'This is the description for my event.'

      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      fill_in :event_title, with: title
      fill_in :event_start_date, with: startTime
      fill_in :event_end_date, with: endTime
      fill_in :event_description, with: description

      find('[data-test="submit"]').click

      expect(page.body).to include('Event successfully created.')
      expect(page.body).to include(title)
    end

    scenario 'when unsuccessful' do
      title = 'My Event'
      startTime = Date.today + 2.days

      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      find('[data-test="submit"]').click

      expect(page.body).to include('Event could not be created.')

      fill_in :event_title, with: title
      fill_in :event_start_date, with: startTime

      find('[data-test="submit"]').click

      expect(page.body).to include('Event successfully created.')
      expect(page.body).to include(title)
    end
  end

  context 'user edits an event' do
    let!(:event) { create :event, user_id: user.id }

    before(:each) do
      visit event_path(event.id)
    end

    scenario 'when successful' do
      expect(page.body).to have_content(event.title)
      find('[data-test="edit_event"]').click
    end

    scenario 'when unsuccessful' do
      expect(page.body).to have_content(event.title)
    end
  end
end