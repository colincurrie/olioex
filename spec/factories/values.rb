FactoryBot.define do
  factory :value do
    price { rand(0...1000)/100.0 }
    currency { ['GBP','USD','EUR'] }
    payment_type { 'no_payment_type' }
  end
end
