class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
    @product = Product.new
    @image = Image.new
    @categories = Category.where("parent_id= '0'").map{|a| [a[:name], a[:id]] }
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
    @product = Product.find(params[:id])
  end

  def destroy
    products = Product.find(params[:id])
    if products.destroy
       redirect_to mypages_path
    else
      render :show
    end
  end

  def detail
    @product = Product.find(params[:id])
    @product_user = Product.find_by(user_id: params[:user_id])
    @category_id = Category.find(@product.category_id)
    @category_child_id = Category.find(@category_id.parent_id)
    @category_parent_id = Category.find(@category_child_id.parent_id)
    @image = Image.find(params[:id])
    @review_good = Review.where(rate: 0).count
    @review_nomal = Review.where(rate: 1).count
    @review_bad = Review.where(rate: 2).count
    @user = User.find(params[:id])
    @like = Like.new
    @likes_count = Like.where(product_id: @product.id).count
    @after_item = Product.order("RAND()").first
    @before_item = Product.order("RAND()").last
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

end
