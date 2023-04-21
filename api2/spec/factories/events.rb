# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    association :user
    sequence(:eventTitle) { |n| "title_#{n}" }

    startDate { Date.today() + 1.day }
  end
end
