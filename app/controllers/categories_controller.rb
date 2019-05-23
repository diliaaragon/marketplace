class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end