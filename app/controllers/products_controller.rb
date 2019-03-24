class ProductsController < ApplicationController
  
  def show
  end

  def index
    @products = Product.all
  end
end
