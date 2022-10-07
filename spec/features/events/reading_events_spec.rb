# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user reads events' do
  let!(:user) { create :user, role: 0 }
  let!(:event) { create :event, user_id: user.id }
  let!(:user2) { create :user, role: 0 }
  let!(:event2) { create :event, user_id: user2.id }
  let!(:admin) { create :user, role: 2 }
  let!(:superadmin) { create :user, role: 3 }

  describe 'private events for end users' do
    context 'enduser only sees their private events' do
      it 'is successful' do
        sign_in user
        visit root_path

        title1 = event.title
        title2 = event2.title
        expect(page.body).to have_content(title1)
        expect(page.body).to_not have_content(title2)

        find("[data-test=\"#{title1}\"]").click
        expect(page.body).to have_selector('h2', text: title1)

        visit event_path(event2.id)
        expect(page.body).to have_content('You are not authorized to perform this action.')
      end
    end
  end

  describe 'private events for admin users' do
    context 'admin can view all events' do
      it 'is successful' do
        sign_in admin
        visit root_path

        title1 = event.title
        title2 = event2.title
        expect(page.body).to have_content(title1)
        expect(page.body).to have_content(title2)

        find("[data-test=\"#{title1}\"]").click
        expect(page.body).to have_selector('h2', text: title1)

        visit root_path

        find("[data-test=\"#{title2}\"]").click
        expect(page.body).to have_selector('h2', text: title2)
      end
    end
  end

  describe 'private events for superadmin users' do
    context 'superadmin can view all events' do
      it 'is successful' do
        sign_in superadmin
        visit root_path

        title1 = event.title
        title2 = event2.title
        expect(page.body).to have_content(title1)
        expect(page.body).to have_content(title2)

        find("[data-test=\"#{title1}\"]").click
        expect(page.body).to have_selector('h2', text: title1)

        visit root_path

        find("[data-test=\"#{title2}\"]").click
        expect(page.body).to have_selector('h2', text: title2)
      end
    end
  end
end
