class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end
<<<<<<< HEAD
  def destroy
    products = Product.find(params[:id])
    if products.destroy
       redirect_to root_path
    else
      render :show
    end
  end
=======
>>>>>>> wonder-boooy/master

  def confirmation
  end
end
