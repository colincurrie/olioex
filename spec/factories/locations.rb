FactoryBot.define do
  factory :location do
    latitude { rand(47.0...53.0)}
    longitude { -3.0...3.0 }
    distance { 0.0...15.0 }
    town { Faker::Address.town }
    country { Faker::Address.country }
  end
end
