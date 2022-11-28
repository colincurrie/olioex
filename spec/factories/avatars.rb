FactoryBot.define do
  factory :avatar do
    original_url { Faker::Internet.url }
    large_url { Faker::Internet.url }
    small_url { Faker::Internet.url }
  end
end
