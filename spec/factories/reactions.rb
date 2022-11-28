FactoryBot.define do
  factory :reaction do
    likes { rand(0...10) }
    by_user { false }
    views { rand(0...100) }
    impressions { rand(0...10) }
  end
end
