# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin user signs in' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', admin: true }
  let!(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  context 'when successful' do
    scenario 'only admin can view the admin dashboard' do
      params = {admin_id: admin.id}

      visit new_user_session_path
      expect(page).to have_content('Log in')

      fill_in :user_email, with: user.email
      fill_in :user_password, with: '12345ABCDEfghi!'
      find('[data-test="submit"]').click

      expect(page).to_not have_content('Dashboard')
      expect(page).to have_content('Welcome to Lettuce Meet.')

      find('[data-test="sign_out_btn"]').click

      expect(page).to have_content('Log in')

      fill_in :user_email, with: admin.email
      fill_in :user_password, with: '12345ABCDEfghi!'
      find('[data-test="submit"]').click

      expect(page).to have_content('Dashboard')
      expect(page).to_not have_content('Welcome to Lettuce Meet.')
      find('[data-test="admin_dash_btn"]').click

      expect(page).to have_content(admin.name)
    end
  end

  context 'when unsuccessful' do
    scenario 'user tries to go to admin dashboard' do
      sign_in user

      visit admin_index_path

      expect(page).to have_content('Permissions denied')
    end
  end
end
