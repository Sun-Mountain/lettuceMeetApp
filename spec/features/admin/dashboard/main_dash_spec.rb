# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin dashboard' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', admin: true }

  before(:each) do
    sign_in admin
    visit root_path
  end

  describe 'user dashboard' do
    scenario 'shows all users' do
      it 'is successful' do
        total = User.all.count
        expect(page).to have_content('Dashboard')
  
        find('[data-test="admin_users_btn"]').click
  
        users = find('ul').all('li')
  
        expect(users.size).to equal(total)
      end
    end
  end
end