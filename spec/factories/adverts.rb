# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advert do
    user                  { Factory :user }
    title                 { Faker::Lorem.word }
    content               { Faker::Lorem.sentence }
  end
end
