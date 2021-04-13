FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname { Faker::Name.initials(number: 2) }
    first_name { '一露' }
    last_name { '田中' }
    first_name_reading { 'イチロ' }
    last_name_reading { 'タナカ' }
    birthday { '1930-01-01' }
  end
end
