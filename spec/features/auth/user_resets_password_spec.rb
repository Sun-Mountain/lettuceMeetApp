# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user resets password' do
  let(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  scenario 'when successful' do
    visit new_user_password_path

    expect(page.body).to have_content('Forgot your password?')

    fill_in 'user_email', with: user.email
    find('input[data-test="submit"]').click

    expect(ActionMailer::Base.deliveries.count).to eq(1)

    last_delivery = ActionMailer::Base.deliveries.last
    email = last_delivery.body

    reset_link = last_delivery.body.raw_source.match(/href="(?<url>.+?)">/)[:url]

    visit reset_link

    expect(page.body).to include('Change your password')

    fill_in 'user_password', with: '3v3ryDayP0tat0!'
    fill_in 'user_password_confirmation', with: '3v3ryDayP0tat0!'
    find('input[data-test="submit"]').click

    expect(page.body).to include('Your password has been changed successfully')

    visit root_path

    fill_in :user_email, with: user.email
    fill_in :user_password, with: '3v3ryDayP0tat0!'
    find('input[data-test="submit"]').click

    expect(page.body).to include('Signed in successfully.')
  end
end
