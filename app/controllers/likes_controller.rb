class LikesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @like = Like.new(
      product_id: params[:product_id],
      user_id: current_user.id
    )
    if @like.save
      redirect_to detail_product_path(@product)
    else
      render template: 'products/show'
    end
    @likes = Like.where(product_id: params[:product_id])
  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    @like.destroy
    redirect_to detail_product_path(params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
  end

  private
    def like_params
      params.require(:like).permit(:product_id, :user_id)
    end
end
