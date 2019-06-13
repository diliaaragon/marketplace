require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  describe 'GET #index' do
    subject { get :index }

    before { subject }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:products)).to eq([product]) }
  end
end