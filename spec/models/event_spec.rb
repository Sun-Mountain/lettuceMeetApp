# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create :user }
  subject { create :event, user_id: user.id }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#title' do
    it 'requires a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#start_date' do
    it 'requires a start_date' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#user_id' do
    it 'requires a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
