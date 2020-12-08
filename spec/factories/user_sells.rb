FactoryBot.define do
  factory :user_sell do
    post_number {'111-1111'}
    delivery_source_region_id{2}
    city{'名古屋市'}
    address{'123'}
    building_name{'テストハイツ'}
    phone_number{'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end