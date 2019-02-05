class BrandsController < ApplicationController

  # インクリメンタルサーチ用アクション
  def show
    @brands = Brand.where('list LIKE(?)',"%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

end
