class DeliveriesController < ApplicationController

  before_action :set_delivery, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]

  def index
    @deliveries = Delivery.paginate(:page => params[:page], :per_page => 4)
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      flash[:success] = "Hoorey"
      redirect_to @delivery
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @delivery.update_attributes(delivery_params)
      redirect_to @delivery
    else
      render 'edit'
    end
  end

  def destroy
    @delivery.destroy
    flash[:success] = "Product was deleted"
    redirect_to deliveries_path
  end

private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:description)
  end
end
