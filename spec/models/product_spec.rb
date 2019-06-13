require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { create(:user)}
  subject { FactoryBot.create(:product, user: user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(15) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(10) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'relations' do
    it { is_expected.to have_and_belong_to_many(:categories) }
    it { is_expected.to belong_to(:user) }
  end
end