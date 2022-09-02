# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user edits profile' do
  let(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  before(:each) do
    sign_in user
    visit edit_user_registration_path
  end

  describe 'user changes their name' do
    scenario 'when successful' do
      fill_in 'user_first_name', with: 'James'
      fill_in 'user_last_name', with: 'Kirk'
      fill_in 'user_current_password', with: '12345ABCDEfghi!'
  
      find('[data-test="update-account"]').click
  
      expect(page.body).to have_content('Your account has been updated successfully.')
    end
  end

  describe 'user changes their email' do
    scenario 'when successful' do
      fill_in 'user_email', with: 'kirk@gmail.com'
      fill_in 'user_current_password', with: '12345ABCDEfghi!'
  
      find('[data-test="update-account"]').click
  
      expect(page.body).to have_content('Your account has been updated successfully.')
    end
  end

  describe 'user changes their password' do
    scenario 'when successful' do
      fill_in 'user_password', with: 'fghi!12345ABCDE'
      fill_in 'user_password_confirmation', with: 'fghi!12345ABCDE'
      fill_in 'user_current_password', with: '12345ABCDEfghi!'
  
      find('[data-test="update-account"]').click
  
      expect(page.body).to have_content('Your account has been updated successfully.')
    end
  end
end
