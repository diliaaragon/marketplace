require 'faker'

FactoryBot.define do
  factory :product do
    name { Faker::House.furniture }
    description  { Faker::String.random(10..25) }
    quantity { Faker::Number.number(2) }
    price { Faker::Number.number(5) }
    association :user
  end
end