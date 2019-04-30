# frozen_string_literal: true

# Product controller with the CRUD methods
class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  before_action :set_product, except:[ :index, :new, :create, :show ]

  def index
    @products = Product.product_by_user(current_user)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(products_params)
    @product.user_id = current_user.id
    if @product.save
      flash[:notice] = 'Product was successfully created'
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def publish
<<<<<<< HEAD
=======
    @product = Product.find(params[:id])
>>>>>>> Add the method publish to products controller and add bootton publish
    @product.publish!
    redirect_to @product
  end

<<<<<<< HEAD
  def archive
    @product.archive!
    redirect_to @product
  end

=======
>>>>>>> Add the method publish to products controller and add bootton publish
  def show
    @product = Product.find(params[:id])
  end

  def update
    @product.user_id = current_user.id
    if @product.update(products_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :description,
                                    :quantity, :price,
                                    :image, category_ids:[])
  end

  def set_product
    @product = Product.product_by_user(current_user).find(params[:id])
  end
end