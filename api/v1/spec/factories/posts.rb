FactoryBot.define do
  factory :post do
    user { nil }
    title { "MyString" }
    body { "MyText" }
  end
end
