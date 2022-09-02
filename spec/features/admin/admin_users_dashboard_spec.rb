# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin can manage users' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', admin: true }
  let!(:user2) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  before(:each) do
    sign_in admin
    visit root_path
  end

  context 'shows all users' do
    scenario 'when successful' do
      total = User.all.count
      expect(page).to have_content('Dashboard')

      find('[data-test="admin_users_btn"]').click

      users = find('ul').all('li')

      expect(users.size).to equal(total)
    end
  end
end
