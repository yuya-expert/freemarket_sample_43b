class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def confirmation
  end
end
