FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "event_#{n}" }
    sequence(:start_date) { |n| Date.today }

    public { false }
    all_day { false }
    description { 'This is a description for the event' }
    user_id { 1 }
  end
end
