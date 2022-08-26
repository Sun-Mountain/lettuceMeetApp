# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create :user }
  subject { create :event, user_id: user.id }

  describe 'factory' do
    it { is_expected.to be_valid }
  end
end
