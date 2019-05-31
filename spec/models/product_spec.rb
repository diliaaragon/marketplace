require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with name, description, quantity, price and user_id' do 
    user = create(:user, id: 1)
    product = build(:product)
    expect(product).to be_valid
  end

  it 'is invalid without user id' do 
    user = create(:user, id: nil)
    product = build(:product)
    expect(product).to_not be_valid
  end

  it 'is invalid without name' do
    product = build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it 'is invalid with a name length less than 3 characters' do
    product = build(:product, name: 'lo')
    expect(product).to_not be_valid
  end

  it 'is invalid with a name length greater than 10 characters' do
    product = build(:product, name: 'this product is new')
    expect(product).to_not be_valid
  end

  it 'is invalid without description' do
    product = build(:product, description: nil)
    expect(product).to_not be_valid
  end

  it 'is invalid with a description length less than 10 characters' do
    product = build(:product, description:'hello')
    expect(product).to_not be_valid
  end

  it 'is invalid without quantity' do
    product = build(:product, quantity: nil)
    expect(product).to_not be_valid
  end

  it 'is invalid without price' do
    product = build(:product, price: nil)
    expect(product).to_not be_valid
  end
end