# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user creates events' do
  let!(:user) { create :user }
  let!(:event) { create :event, user_id: user.id }

  before(:each) do
    sign_in user
    visit event_path(event.id)
  end

  describe 'user deletes event' do
    scenario 'when successful' do
      expect(page.body).to have_content(event.title)

      find('[data-test="delete_event"]').click

      expect(page.body).to have_content('Event successfully deleted.')
    end
  end
end