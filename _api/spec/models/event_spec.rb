# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { create :event }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#eventTitle' do
    it 'is required' do
      subject.eventTitle = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#startDate' do
    it 'is required' do
      subject.startDate = nil
      expect(subject).to_not be_valid
    end

    it 'must be a date' do
      subject.startDate = "This is a string"
      expect(subject).to_not be_valid
    end
  end
end
