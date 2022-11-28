FactoryBot.define do
  factory :request do
    user { nil }
    requestable_type { "MyString" }
    method { 1 }
  end
end
