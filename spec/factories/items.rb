FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    payment "100000"}
    association :user 
  end
end