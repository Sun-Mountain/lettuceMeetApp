# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user deletes events' do
  let!(:user) { create :user }
  let!(:event) { create :event, user_id: user.id }

  it 'is successful' do
    sign_in user
    visit event_path(event.id)
    expect(page.body).to have_content(event.title)

    find('[data-test="delete_event"]').click

    expect(page.body).to have_content('Event successfully deleted.')
  end
end
