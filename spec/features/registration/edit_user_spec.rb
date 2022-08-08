require 'rails_helper'

RSpec.feature 'user edits profile' do
  let(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  before(:each) do
    sign_in user
    visit edit_user_registration_path
  end

  scenario 'user changes their name' do
    fill_in 'user_first_name', with: 'James'
    fill_in 'user_last_name', with: 'Kirk'
    fill_in 'user_current_password', with: '12345ABCDEfghi!'

    find('[data-test="update-account"]').click
    
    expect(page.body).to have_content('Your account has been updated successfully.')
  end
end
