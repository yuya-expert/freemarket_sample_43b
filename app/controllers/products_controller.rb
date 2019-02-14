class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_product, only: [:edit, :update]
  before_action :set_categories, only: [:new, :edit]
  protect_from_forgery except: :update

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
    @product = Product.new
    @image = Image.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def search_category
    @child_categories = Category.where(("parent_id= #{params[:id]}")).map{|a| [a[:name], a[:id]]}
    respond_to do |format|
      format.json
    end
  end

  def edit
    @images = Image.where(product_id: params[:id])
  end

  def update
    if @product.update(images_params)
      unless params[:images].nil?
        params[:images]['image'].each do |i|
          @image = @product.images.create!(image: i, product_id: @product.id)
        end
      end
      redirect_to controller: :mypages , action: :index
    else
      redirect_to action: :edit
    end
  end

  def destroy
    products = Product.find(params[:id])
    if products.destroy
       redirect_to mypages_path
    else
      render :show
    end
  end


  def confirmation
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status, :shipping_method, :user_id, :brand_id, :category_id)
  end

  def image_params
    params.require(:image).permit(image: []).merge(product_id: @product.id)
  end

  def images_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status,images_attributes: [:id, :image, :product_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.where("parent_id= '0'").map{|a| [a[:name], a[:id]] }
  end
end
