FactoryBot.define do
  factory :user do
    first_name       { "John" }
    last_name        { "Doe" }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password         { "12345678910" }
  end
end
