# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { create :event }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#event_title' do
    it 'is required' do
      subject.event_title = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#start_date' do
    it 'is required' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it 'must be a date' do
      subject.start_date = "This is a string"
      expect(subject).to_not be_valid
    end
  end
end
