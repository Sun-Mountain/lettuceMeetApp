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
      startDate = Date.today + 2.days
      endDate = Date.today + 3.days
      description = 'This is the description for my event.'

      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      fill_in :event_title, with: title
      fill_in :event_start_date, with: startDate
      fill_in :event_end_date, with: endDate
      fill_in :event_description, with: description

      find('[data-test="submit"]').click

      expect(page.body).to include('Event successfully created.')
      expect(page.body).to include(title)
    end

    scenario 'when unsuccessful' do
      title = 'My Event'
      startDate = Date.today + 2.days

      find('[data-test="new_events_link"]').click

      expect(page.body).to include('New Event')

      find('[data-test="submit"]').click

      expect(page.body).to include('Event could not be created.')

      fill_in :event_title, with: ''
      fill_in :event_start_date, with: startDate

      find('[data-test="submit"]').click

      expect(page.body).to include('Event could not be created.')
    end
  end

  context 'user edits an event' do
    let!(:event) { create :event, user_id: user.id }

    before(:each) do
      visit event_path(event.id)
      find('[data-test="edit_event"]').click
      expect(page).to have_selector("input[value='#{event.title}']")
      expect(page).to have_selector("input[value='#{event.start_date}']")
    end

    scenario 'when successful' do
      newTitle = 'My New Title'
      newStartDate = Date.today + 3.days
      newEndDate = Date.today + 4.days
      newDescription = 'Boom Bam'

      fill_in :event_title, with: newTitle
      fill_in :event_start_date, with: newStartDate
      fill_in :event_end_date, with: newEndDate
      fill_in :event_description, with: newDescription

      find('[data-test="update"]').click

      expect(page.body).to have_content('Event successfully updated.')
    end

    scenario 'when unsuccessful' do
      fill_in :event_title, with: ''

      find('[data-test="update"]').click

      expect(page.body).to have_content('Event could not be updated.')
    end
  end
end