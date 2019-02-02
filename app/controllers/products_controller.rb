class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    binding.pry
    if product.save
      redirect_to action: :index
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status)
  end

end
