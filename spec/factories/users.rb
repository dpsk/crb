# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    name                  { Faker::Name.first_name}
    password              "password"
    password_confirmation "password"
    confirmed_at          { Time.now }
  end
end
