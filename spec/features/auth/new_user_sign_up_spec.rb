# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'new user signs up for account' do
  before(:each) do
    visit new_user_session_path
    click_link 'Sign up'
  end

  scenario 'when successful' do
    fill_in :user_first_name, with: 'Samuel'
    fill_in :user_last_name, with: 'Vimes'
    fill_in :user_email, with: 'vimes@gmail.com'
    fill_in :user_password, with: '3veryDay#P0tato'
    fill_in :user_password_confirmation, with: '3veryDay#P0tato'

    find('[data-test="submit"]').click
  end
end
