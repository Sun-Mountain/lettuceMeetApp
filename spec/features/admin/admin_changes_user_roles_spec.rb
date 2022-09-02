# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin user signs in' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', admin: true }
  let!(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }
  let!(:user2) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }
  let!(:user3) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }
  
  context 'when successful' do
    before(:each) do
      sign_in admin
      visit root_path
    end

    scenario 'admin authorizes user' do
      total = User.all
      admins = User.where(admin: true)
      number_of_admins = admins.count
      total_users = total.count
      auth_user = user

      expect(auth_user.authorized).to eq(false)

      expect(page).to have_content('Dashboard')

      find('[data-test="admin_users_btn"]').click
      users = find('ul').all('li')

      expect(users.size).to equal(total_users)
      expect(page).to have_css '.admin-button', count: number_of_admins
      expect(page).to have_css '.not-admin-button', count: total_users - number_of_admins
      expect(page).to have_css '.authorized', count: 0
      expect(page).to have_css '.unauthorized', count: total_users - number_of_admins

      find("[data-test=\"deauth-user-#{auth_user.id}\"]").click

      expect(page.body).to have_content("#{auth_user.name} is now Authorized.")

      expect(auth_user.reload.authorized).to eq(true)

      number_of_unauth_users = User.where(authorized: false, admin: false).count

      expect(page).to have_css '.admin-button', count: number_of_admins
      expect(page).to have_css '.not-admin-button', count: total_users - number_of_admins
      expect(page).to have_css '.authorized', count: 1
      expect(page).to have_css '.unauthorized', count: number_of_unauth_users
    end

    scenario 'admin makes user admin' do
      expect(page).to have_content('Dashboard')
    end
  end
end