class ImagesController < ApplicationController
  def create
    image = Product.image.build(images_params)
    if image.save!
      render json: image
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    image = Image.find_by_id(params[:id])
    if image.destroy
      render json: image
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def images_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status,images_attributes: [:id, :image, :product_id])
  end
end
