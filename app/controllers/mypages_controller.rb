class MypagesController < ApplicationController

  def index
    @user = current_user
    @reviews = Review.where(params[:user_id]).count
    @products = Product.where(params[:user_id]).count
  end

  def payments
  end

  def show
  end

  def edit
    @user = current_user
  end

  def destroy
  end

end
