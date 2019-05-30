FactoryBot.define do
  factory :product do
    name { "product" }
    description  { "un producto" }
    quantity { 12 }
    price { 1200 }
  end
end