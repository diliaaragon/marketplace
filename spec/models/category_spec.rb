require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with name' do
    category = build(:category)
    expect(category).to be_valid
  end

  it 'is invalid without name' do
    category = build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it ' is invalid with a duplicate name' do
    category1 = create(:category, name: 'cosmetic')
    category = build(:category, name: 'cosmetic')
    expect(category).to_not be_valid
  end
end