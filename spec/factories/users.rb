FactoryBot.define do
  factory :user do
    name                 {Faker::Name.initials(number: 2)}
    email                {Faker::Internet.free_email}
    first_name           {"なまえ"}
    family_name          {"みょうじ"}
    first_name_kana      {"ナマエ"}
    family_name_kana     {"ミョウジ"}
    birthday             {Faker::Date.in_date_period}
    password             {"00a22s"}
    # password_confirmation {password}
  end
end
