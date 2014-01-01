class StocksController < ApplicationController

  before_filter :signed_in_user, :only => [:new, :create, :edit, :index, :destroy, :update]
  before_filter :admin_user, :only => :destroy
  before_action :set_stock, :only => [:edit, :show, :edit, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show]

  def show
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to 'index'
    end
  end

  def index
    @stocks = Stock.all
  end

  def edit

  end

  def update
    if @stock.update_attributes(stock_params)
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
    @stock.destroy
    flash[:success] = "Акция удаленна"
    redirect_to stocks_path
  end

private

  def set_stock
    begin
      @stock = Stock.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Попытка доступа к запись акции #{params[:id]}"
      redirect_to stocks_path, :notice => "Такой акции не существует"
    else
      @stock = Stock.find(params[:id])
    end
  end

  def stock_params
    params.require(:stock).permit(:images, :description)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
