require 'faker'

FactoryBot.define do
  factory :product do
    association :user
    name { Faker::Name.first_name }
    description  { Faker::Food.description }
    quantity { Faker::Number.number(2) }
    price { Faker::Number.number(5) }
  end
end