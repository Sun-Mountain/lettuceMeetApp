# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    association :user
    sequence(:event_title) { |n| "title_#{n}" }

    start_date { Date.today() + 1.day }
  end
end
