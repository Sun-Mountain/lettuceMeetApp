# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }

    password { '12345ABCDEfghi!' }
    password_confirmation { '12345ABCDEfghi!' }
  end
end
