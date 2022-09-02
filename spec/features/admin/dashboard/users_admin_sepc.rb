# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin can appoints users' do
  let!(:admin) { create :user, admin: true }

  before(:each) do
    sign_in admin
  end

  context 'when admin makes user admin' do
    it 'is successful' do
      new_admin = create(:user)
      visit admin_users_path
      admin_users = User.where(admin: true).count

      expect(page).to have_css '.authorized', count: admin_users
      expect(new_admin.authorized).to eq(false)

      find("[data-test=\"no-admin-user-#{new_admin.id}\"]").click

      expect(page.body).to have_content("#{new_admin.name} is now an Administrator.")
      expect(new_admin.reload.authorized).to eq(true)
      expect(page).to have_css '.authorized', count: admin_users + 1
    end
  end

  context 'when admin deauthorizes user' do
    it 'is successful' do
      old_admin = create(:user, admin: true)
      visit admin_users_path
      admin_users = User.where(admin: true).count

      expect(page).to have_css '.admin', count: admin_users
      expect(old_admin.authorized).to eq(true)

      find("[data-test=\"admin-user-#{old_admin.id}\"]").click

      expect(page.body).to have_content("#{old_admin.name} is no longer an Administrator.")
      expect(old_admin.reload.authorized).to eq(false)
      expect(page).to have_css '.admin', count: admin_users - 1
    end
  end
end
