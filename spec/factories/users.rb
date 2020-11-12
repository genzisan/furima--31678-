FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name    { '川下' }
    first_name   { '源二' }
    last_name_kana { 'カワシタ' }
    first_name_kana { 'ゲンジ' }
    birth_day { '2000-01-01' }
  end
end
