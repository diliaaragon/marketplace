class WelcomeController < ApplicationController
  def index
    @products = Product.published
  end

  def show
  end
end
