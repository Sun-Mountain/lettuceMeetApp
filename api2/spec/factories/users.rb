# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:firstName) { |n| "first_#{n}" }
    sequence(:lastName) { |n| "last_#{n}" }
    sequence(:preferredUsername) { |n| "username_#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }

    password { '12345ABCDEfghi!' }
    password_confirmation { '12345ABCDEfghi!' }
  end
end
