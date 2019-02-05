class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
    @product = Product.new
    @categories = Category.where("parent_id= '0'")
    @categories = @categories.map{|a| [a[:name], a[:id]] }
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to action: :index
    end
  end

  def search_category
    @child_categories = Category.where(("parent_id= #{params[:id]}"))
    @child_categories = @child_categories.map{|a| [a[:name], a[:id]]}
    respond_to do |format|
      format.json
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status, :category_id)
  end

  def confirmation
  end
end
