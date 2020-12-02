FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
  after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
  end
    explanation {Faker::Lorem.sentence}
    payment {"100000"}
    category_id {2}
    delivery_source_region_id {2}
    preparetion_day_id {2}
    fee_id {2}
    status_id {2}

    association :user 
  end
end