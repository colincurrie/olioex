FactoryBot.define do
  factory :photo do
    uid {Faker::Internet.uuid }
    original_url { Faker::Internet.url }
    large_url { Faker::Internet.url }
    medium_url { Faker::Internet.url }
    small_url { Faker::Internet.url }
    width { 640}
    height { 480 }
  end
end
