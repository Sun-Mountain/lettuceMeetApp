
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#email' do
    it 'requires a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'requires unique email' do
      user = create(:user)
      user.email = subject.email
      expect { user.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end