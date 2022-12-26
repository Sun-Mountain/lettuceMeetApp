FactoryBot.define do
  factory :event do
    title { "MyString" }
    body { "MyText" }
    location { "MyString" }
    public { false }
    start_date { "2022-12-26" }
    end_date { "2022-12-26" }
    start_time { "2022-12-26 15:59:03" }
    end_time { "2022-12-26 15:59:03" }
    user { nil }
  end
end
