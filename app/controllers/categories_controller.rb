class CategoriesController < ApplicationController

  before_filter :authenticate_admin_user!, :only => [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]

  def index
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
    #@products = @category.products.build
    if @category.save
      flash[:success] = "Категория добавлена"
      redirect_to @category
    else
      flash[:error] = "Заполните все поля"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Категория отредактированна"
      redirect_to @category
    else
      flash[:error] = "Заполните все поля"
      render 'edit'
    end

  end

  def destroy
    @category.destroy
    flash[:error] = "Категория удаленна"
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name)
  end
private

  def set_category
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Попытка доступа к несуществующей категории #{params[:id]}"
      redirect_to categories_path, :notice => "Категории не существует"
    else
      @category = Category.find(params[:id])
    end
  end

  def admin_user
    redirect_to root_path unless admin?
  end

end
