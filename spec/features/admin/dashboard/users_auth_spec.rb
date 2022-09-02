# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin can manage users' do
  let!(:admin) { create :user, admin: true }

  before(:each) do
    sign_in admin
  end

  scenario 'when admin authorizes user' do
    it 'is successful' do
      new_auth = create(:user)
      visit admin_users_path
      authorized_users = User.where(authorized: true).count

      expect(page).to have_css '.authorized', count: authorized_users
      expect(new_auth.authorized).to eq(false)

      find("[data-test=\"deauth-user-#{new_auth.id}\"]").click

      expect(page.body).to have_content("#{new_auth.name} is now Authorized.")
      expect(new_auth.reload.authorized).to eq(true)
      expect(page).to have_css '.authorized', count: authorized_users + 1
    end
  end

  scenario 'when admin deauthorizes user' do
    it 'is successful' do
      old_auth = create(:user, authorized: true)
      visit admin_users_path
      authorized_users = User.where(authorized: true).count

      expect(page).to have_css '.authorized', count: authorized_users
      expect(old_auth.authorized).to eq(true)

      find("[data-test=\"auth-user-#{old_auth.id}\"]").click

      expect(page.body).to have_content("#{old_auth.name} is now Unauthorized.")
      expect(old_auth.reload.authorized).to eq(false)
      expect(page).to have_css '.authorized', count: authorized_users - 1
    end
  end
end
