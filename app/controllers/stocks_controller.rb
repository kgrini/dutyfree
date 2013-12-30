class StocksController < ApplicationController

  before_action :set_stock, :only => [:edit, :show, :edit, :destroy]

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
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(stock_params)
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
  end

private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:images, :description)
  end
end
