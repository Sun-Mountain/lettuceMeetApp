# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user signs in' do
  let!(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  it 'is successful' do
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: '12345ABCDEfghi!'
    find('[data-test="submit"]').click

    expect(page).to have_content('Signed in successfully.')
  end
end
