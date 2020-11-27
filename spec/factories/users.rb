FactoryBot.define do
  factory :user do
    name                 {Faker::Name.initials(number: 2)}
    email                {Faker::Internet.free_email}
    first_name           {Faker::Name.initials(number: 2)}
    family_name          {Faker::Name.initials(number: 2)}
    first_name_kana      {Faker::Name.initials(number: 2)}
    family_name_kana     {Faker::Name.initials(number: 2)}
    birthday             {Faker::Date.in_date_period}

    password             {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end