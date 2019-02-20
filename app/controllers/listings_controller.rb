class ListingsController < ApplicationController
  before_action :set_user

  def listing
    @products = Product.where(user_id: current_user.id , delivery_status: 0)
  end

  def in_progress
    @products = Product.where(user_id: current_user.id , delivery_status: 1)
  end

  def completed
    @products = Product.where(user_id: current_user.id , delivery_status: 2)
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end
end
