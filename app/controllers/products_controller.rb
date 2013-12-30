class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :load_categories

  def index
    @categories = Category.find(params[:category_id])
    @products = @categories.products
  end

  def new
    @product = @categories.products.new
  end

  def create
    @product = @categories.products.new(product_params)
    if @product.save
      flash[:success] = "Hoorey"
      redirect_to @categories
    else
      flash[:error] = "Fill all fields"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
     redirect_to @product
    else
     render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product was deleted"
    redirect_to products_path
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :categories_id, :categories_type)
  end

private

  def load_categories
    resource, id = request.path.split('/')[1, 2]
    @categories = resource.singularize.classify.constantize.find(id)
  end
end