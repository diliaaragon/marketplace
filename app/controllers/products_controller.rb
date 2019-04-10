# frozen_string_literal: true

# Product controller with the CRUD methods
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(set_params)
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
    if @product.update(set_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private

  def set_params
    params.require(:product).permit(:name, :description, :quantity, :price)
  end
end