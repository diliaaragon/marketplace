require 'rails_helper'
require 'spec_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @category = create(:category)
  end

  describe 'GET index' do
    it 'ok'  do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(assigns(:categories)).to eq([@category])
    end
  end

  describe 'GET show' do
    it 'ok' do
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(assigns(:category)).to eq(@category)
    end

    it "when category doesn't exist" do
      expect { get :show, params: { id: 69696 } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET new' do
    it 'ok' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'GET edit' do
    it 'ok' do
      get :edit, params: { id: @category.id }
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'POST create' do
    before do
      @category = create(:category)
      @attributes = attributes_for(:category)
    end

    context 'with valid params' do
      it 'create a new category'  do
        Category.new
        expect { post :create, params: { category: @attributes } }.to change(Category, :count).by(1)
      end

      it 'assigns a newly created category as @category' do
        post :create, params: { category: @attributes }
        expect(assigns(:category)).to be_a(Category)
      end

      it 'redirects to the create category' do
        post :create, params: { category: @attributes }
        expect(response).to redirect_to(categories_path)
      end
    end
  end

  describe 'PUT update' do
    before do
      @@category = create(:category)
      @attributes = { name: 'newcategory' }
    end

    context 'with valid params' do
      it 'assigns the product as @product' do
        put :update, params: { id: @category.id, category: @attributes }
        expect(assigns(:category).name).to eq @attributes[:name]
      end

      it 'redirects' do
        put :update, params: { id: @category.id, category: @attributes }
        expect(response).to redirect_to(categories_path)
      end
    end
  end
end