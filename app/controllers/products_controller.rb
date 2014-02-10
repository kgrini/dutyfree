class ProductsController < ApplicationController

  before_filter :authenticate_admin_user!, :only => [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :load_categories
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index, :show]

  def index
    @categories = Category.find(params[:category_id])
    @products = @categories.products.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @product = @categories.products.new
  end

  def create
    @product = @categories.products.new(product_params)
    if @product.save
      flash[:success] = "Hoorey"

      respond_to do |format|
        format.html {}
        format.js
      end
    else
      flash[:error] = "Fill all fields"
      render :new
    end
  end

  def show
    @cart = current_cart
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
     redirect_to [@categories, @product]
    else
     render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product was deleted"
    redirect_to @categories
  end

  def set_product
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Попытка доступа к несуществующему продукту #{params[:id]}"
      redirect_to categories_path, :notice => "Продукта не существует"
    else

    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :size, :price, :images, :categories_id, :categories_type)
  end

private
  def load_categories
    begin
      resource, id = request.path.split('/')[1, 2]
    rescue ActiveRecord::RecordNotFound
      @categories = resource.singularize.classify.constantize.find(id)
    end
  end
end