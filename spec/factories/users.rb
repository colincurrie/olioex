FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    avatar
    latitude { rand(47.0...53.0) }
    longitude { rand(-3.0...3.0) }
    rating { rand(0...5) }
    number { rand(0...5) }
  end
end
