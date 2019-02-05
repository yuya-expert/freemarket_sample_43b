class ProductsController < ApplicationController
  # before_action :move_index, except: [:index]

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

  private

  def move_index
    redirect_to action: :index unless user_signed_in?
  end
end
