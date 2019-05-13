class WelcomeController < ApplicationController
  def index
    @products = Product.published
  end
end
