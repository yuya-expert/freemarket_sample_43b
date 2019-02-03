class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
  end

end
