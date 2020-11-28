FactoryBot.define do
  factory :user do
    name                 {Faker::Name.initials(number: 2)}
    email                {Faker::Internet.free_email}
    # 以下は日本語の名前に変えましょう/Gimei
    first_name           {"なまえ"}
    family_name          {"みょうじ"}
    first_name_kana      {"ナマエ"}
    family_name_kana     {"ミョウジ"}
    birthday             {Faker::Date.in_date_period}
   # https://github.com/faker-ruby/faker#usage 
    password             {"00a22s"}
    # password_confirmation {password}
  end
end