# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user creates events' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
  end
end