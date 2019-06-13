require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category) { create(:category) }

  describe 'GET index' do
    subject { get :index }

    before { subject }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:categories)).to eq([category]) }
  end

  describe 'GET show' do

    context 'when category exist' do
      subject { get :show, params: { id: category.id } }

      before { subject }
      it { expect(response).to render_template(:show) }
      it { expect(assigns(:category)).to eq(category) }
    end

    context "when category doesn't exist" do
      it { expect { get :show, params: { id: 69696 } }
        .to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe 'GET new' do
    let(:category) { build(:category) }
    subject { get :new }

    before { subject }
    it { expect(assigns(:category)).to be_a_new(Category) }
  end

  describe 'GET edit' do
    let(:params) { { id: category.id } }
    subject { get :edit, params: params }

    before { subject }
    it { expect(assigns(:category)).to eq(category) }
  end

  describe 'POST create' do
    let(:params) { attributes_for(:category) }
    subject { post :create, params: { category: params } }

    context 'create a new category'  do
      it { expect { subject }.to change(Category, :count).by(1) }
    end

    context 'assigns a newly created category as @category' do
      before { subject }
      it { expect(assigns(:category)).to be_a(Category) }
    end

    context 'redirects to the create category' do
      before { subject }
      it { expect(response).to redirect_to(categories_path) }
    end
  end

  describe 'PUT update' do
    let(:params) { { id: category.id, category: { name: 'newname' } } }
    subject { put :update, params: params }

    before { subject }
    it { expect(assigns(:category).name).to eq('newname') }
    it { expect(response).to redirect_to(categories_path) }
  end
end