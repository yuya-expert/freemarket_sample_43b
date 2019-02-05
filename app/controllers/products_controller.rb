class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
  end

  def destroy
    products = Product.find(params[:id])
    products.destroy
    redirect_to root_path
  end

  def confirmation
  end
end
