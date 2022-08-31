# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin user signs in' do
  let!(:admin) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', admin: true }
  let!(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }
  let!(:user2) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  context 'when successful' do
  end
end