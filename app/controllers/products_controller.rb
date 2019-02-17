class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_product, only: [:edit, :update, :detail]
  before_action :set_categories, only: [:new, :edit, :search]
  protect_from_forgery except: :update

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save!
      unless params[:images].nil?
        params[:images]['image'].each do |i|
          @image = @product.images.create!(image: i, product_id: @product.id)
        end
      end
      redirect_to controller: :mypages , action: :index
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
    if @product.update(product_params)
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
    @product = Product.find(params[:id])
    @user = User.find(current_user)
  end

  def completion
    @product = Product.find(params[:id])
    @product[:delivery_status] = 1
    @product.save
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(
      currency: 'jpy',
      amount: @product.price,
      card: params['payjp-token'])
  end

  def detail
    @product = Product.find(params[:id])
    @product_user = Product.find_by(user_id: params[:user_id])
    @category_id = Category.find(@product.category_id)
    @category_child_id = Category.find(@category_id.parent_id)
    @category_parent_id = Category.find(@category_child_id.parent_id)
    @review_good = Review.where(rate: 0).count
    @review_nomal = Review.where(rate: 1).count
    @review_bad = Review.where(rate: 2).count
    @like = Like.new
    @likes_count = Like.where(product_id: @product.id).count
    @after_item = Product.order("RAND()").first
    @before_item = Product.order("RAND()").last
  end

  def search
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status, :shipping_method, :user_id, :brand_id, :category_id, images_attributes: [:id, :image, :product_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.where("parent_id= '0'").map{|a| [a[:name], a[:id]] }
  end
end
