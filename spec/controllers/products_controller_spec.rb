require 'rails_helper'
require 'spec_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  before { sign_in user }

  describe 'GET #index' do
    subject { get :index }

    before { subject }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:products)).to eq([product]) }
  end

  describe 'GET #show' do
    context 'When product exist' do

      subject { get :show, params:{ id: product.id } }

      before { subject }
      it { expect(response).to render_template(:show) }
      it { expect(assigns(:product)).to eq(product) }
    end

    context "when product doesn't exist" do
      it { expect { get :show, params: { id: 69696 } }
        .to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe 'GET new' do
    let(:product) { build(:product) }
    subject { get :new }

    before { subject }
    it { expect(assigns(:product)).to be_a_new(Product) }
  end

  describe 'GET edit' do
    let(:params) { { id: product.id } }
    subject { get :edit, params: params}

    before { subject }
    it { expect(assigns(:product)).to eq(product) }
  end

  describe 'POST create' do
    let(:params) { attributes_for(:product) }
    subject { post :create, params: { product: params } } 

    context 'with valid params' do
      before { subject }
      it { expect { post :create, params: { product: params } }.to change(Product, :count).by(1) }
    end

    context 'assigns a newly created product as @product' do
      before { subject }
      it { expect(assigns(:product)).to be_a(Product) }
    end

    context 'redirects to the create product' do
      before { subject }
      it { expect(response).to redirect_to(product_path(Product.last)) }
    end
  end

  describe 'PUT update' do
    let(:params) { { id: product.id, product: { name: 'newnamepr' } } }
    subject { put :update, params: params }

    before {subject}
    it { expect(assigns(:product).name).to eq('newnamepr') }
    it { expect(response).to redirect_to(product_path(product)) }
  end
end