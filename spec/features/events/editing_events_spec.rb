# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user edits events' do
  let!(:user) { create :user }
  let!(:event) { create :event, user_id: user.id }

  before(:each) do
    sign_in user
    visit event_path(event.id)
    find('[data-test="edit_event"]').click
    expect(page).to have_selector("input[value='#{event.title}']")
    expect(page).to have_selector("input[value='#{event.start_date}']")
  end

  context 'user edits an event' do
    scenario 'when successful' do
      new_title = 'My New Title'
      new_start_date = Date.today + 3.days
      new_end_date = Date.today + 4.days
      new_description = 'Boom Bam'

      fill_in :event_title, with: new_title
      fill_in :event_start_date, with: new_start_date
      fill_in :event_end_date, with: new_end_date
      fill_in :event_description, with: new_description

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
