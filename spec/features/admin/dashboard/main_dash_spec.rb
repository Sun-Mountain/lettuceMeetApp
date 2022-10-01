# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin dashboard' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', role: 2 }
  let!(:superadmin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', role: 3 }
  let!(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  describe 'admin user dashboard' do
    context 'shows all users' do
      it 'is successful for admin' do
        sign_in admin
        visit root_path

        total = User.all.count
        expect(page).to have_content('Dashboard')

        find('[data-test="admin_users_btn"]').click

        users = find('ul').all('li')

        expect(users.size).to equal(total)
      end

      it 'is successful for superadmin' do
        sign_in superadmin
        visit root_path

        total = User.all.count
        expect(page).to have_content('Dashboard')

        find('[data-test="admin_users_btn"]').click

        users = find('ul').all('li')

        expect(users.size).to equal(total)
      end

      it 'is unsuccessful for regular user' do
        sign_in user
        visit root_path

        expect(page).to_not have_content('Dashboard')

        visit admin_index_path
        expect(page).to have_content('Something went wrong. Please try again later.')
      end
    end
  end
end
