FactoryBot.define do
  factory :article do
    title { Faker::Food.ingredient }
    description { Faker::Lorem.paragraph }
    donation_description { Faker::Lorem.sentence }
    section { ['food','product'].select }
    location
    collection_notes { Faker::Lorem.sentence }
    value
    status { "active" }
    expiry { 1.week.from_now }
    reactions
    is_owner { false }
    photos
    user
    last_listed { 1.week.ago }
  end
end
