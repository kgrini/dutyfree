class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category
    @products = @categories.products
    @product = Product.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @products = @category.products.build
    if @category.save
      flash[:success] = "Category created successfuly"
      redirect_to @category
    else
      flash[:error] = "Fill all fields"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category was updated"
      redirect_to @category
    else
      flash[:error] = "Fill all fields"
      render 'edit'
    end

  end

  def destroy
    @category.destroy
    flash[:error] = "Category wass all products was deleted"
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name)
  end
private

  def set_category
    @category = Category.find(params[:id])
  end
end
