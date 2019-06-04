require 'rails_helper'
require 'spec_helper'

RSpec.describe ProductsController, type: :controller do

  before do
    @user = create(:user)
    sign_in @user
    @product = create(:product)
  end

  describe 'GET index' do
    it 'ok'  do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(assigns(:products)).to eq([@product])
    end
  end

  describe 'GET show' do
    it 'ok' do
      get :show, params: { id: @product.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(assigns(:product)).to eq(@product)
    end

    it "when product doesn't exist" do
      expect { get :show, params: { id: 69696 } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET new' do
    it 'ok' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe 'GET edit' do
    it 'ok' do
      get :edit, params: { id: @product.id }
      expect(assigns(:product)).to eq(@product)
    end
  end

  describe 'POST create' do
    before do
      @user = create(:user)
      @new_attributes = attributes_for(:product).merge(user_id: @user.id)
    end

    context 'with valid params' do
      it 'create a new product'  do
        Product.new
        expect { post :create, params: { product: @new_attributes } }.to change(Product, :count).by(1)
      end

      it 'assigns a newly created product as @product' do
        post :create, params: { product: @new_attributes }
        expect(assigns(:product)).to be_a(Product)
      end

      it 'redirects to the create product' do
        post :create, params: { product: @new_attributes }
        expect(response).to redirect_to(product_path(Product.last))
      end
    end
  end

  describe 'PUT update' do
    before do
      @user = create(:user)
      @product = create(:product)
      @attributes = { name: 'Giancarlos' }
    end

    context 'with valid params' do
      it 'assigns the product as @product' do
        put :update, params: { id: @product.id, product: @attributes }
        expect(assigns(:product).name).to eq @attributes[:name]
      end

      it 'redirects' do
        put :update, params: { id: @product.id, product: @attributes }
        expect(response).to redirect_to(product_path(@product))
      end
    end
  end
end