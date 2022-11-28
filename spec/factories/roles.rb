FactoryBot.define do
  factory :role do
    name { ["Consumer","Food Waste Hero","Volunteer","Administrator"].select }
  end
end
