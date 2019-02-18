class MypagesController < ApplicationController

  def index
    @user = current_user
    @reviews = Review.where(user_id: current_user.id).count
    @products = Product.where(user_id: current_user.id).count
  end

  def payments
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to action: :edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :self_introduction)
  end
end
