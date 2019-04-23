# frozen_string_literal: true

# Product controller with the CRUD methods
class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @products = Product.published
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:notice] = 'Product was successfully created'
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :description, :quantity, :price, :image)
  end
end