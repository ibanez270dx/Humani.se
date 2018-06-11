FactoryBot.define do
  factory :admin do
    name { Faker::Name.name }
    username { Faker::Internet.user_name(name) }
    password Faker::Internet.password
  end
end
