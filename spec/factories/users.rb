FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'daidai2611'}
    password_confirmation {'daidai2611'}
    last_name             {'山駄'}
    first_name            {'太郎'}
    kana_last             {'ヤマダ'}
    kana_first            {'タロウ'}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end