require 'rails_helper'

RSpec.describe User, type: :model do
 
  it 'is valid with first name, last name, email and password' do 
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid with a first name length less than 2 characters' do
    user = build(:user, first_name: 'a')
    expect(user).to_not be_valid
  end

  it 'is invalid with a first name length greater than 25 characters' do
    user = build(:user, first_name:'dilia jaidith aragon aleman')
    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user = build(:user, last_name: nil)
    expect(user).to_not be_valid
  end  

  it 'is invalid with a last name length less than 2 characters' do
    user = build(:user, last_name: 'i')
    expect(user).to_not be_valid
  end

  it 'is invalid with a last name length greater than 25 characters' do
    user = build(:user, last_name:'dilia jaidith aragon aleman')
    expect(user).to_not be_valid
  end

  it 'is invalid without a email addess' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  context 'is invalid if email does not match the format' do
    it 'is invalid without @' do
      user = build(:user, email: 'dgmail.com')
      expect(user).to_not be_valid
    end
  
    it 'is invalid without .' do
      user = build(:user, email: 'd@gmailcom')
      expect(user).to_not be_valid
    end

    it 'is invalid with anything before @' do
      user = build(:user, email: '@gmail.com')
      expect(user).to_not be_valid
    end
  end

  it 'is invalid with a email length greater than 100 characters' do
    user = build(:user, email: 'svjgfyjdsgvfjdsgvjgsdkvdsadsdsafafasfasfasfasasfsafa
                                gdfgdhfvfvhxgfikjh@gmail.com')
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email address' do
    user1 = create(:user, email: 'dj@gmail.com')
    user = build(:user, email: 'dj@gmail.com')
    expect(user).to_not be_valid
  end
end