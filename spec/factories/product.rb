require 'faker'

FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    description  { Faker::Food.description }
    quantity { Faker::Number.number(2) }
    price { Faker::Number.number(5) }
  end
end