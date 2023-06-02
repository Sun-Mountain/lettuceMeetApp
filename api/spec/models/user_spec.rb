# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#first_name' do
    it 'requires a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#last_name' do
    it 'requires a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#preferred_username' do
    it 'requires a username' do
      subject.preferred_username = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#email' do
    it 'requires an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#admin' do
    it 'is false by default' do
      expect(subject.admin).to eq(false)
    end
  end
end
