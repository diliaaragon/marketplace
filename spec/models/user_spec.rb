require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    subject { FactoryBot.create(:user) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(25) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(25) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:email).is_at_most(100) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:products) }
  end
end