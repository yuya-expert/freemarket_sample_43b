class BrandsController < ApplicationController

  # インクリメンタルサーチ用アクション
  def show
    @brands = Brand.where('list LIKE(?)',"%#{params[:keyword]}%")
    render json: @brands
  end

end
