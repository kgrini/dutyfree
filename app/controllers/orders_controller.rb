class OrdersController < ApplicationController

  before_filter :authenticate_admin_user!, :only => [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_category, :only => [:show, :edit, :update, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index, :show]


  def index
    @cart = current_cart
    @order = Order.new
  end
  def new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Заказ отправлен"
      redirect_to root_path
      @cart = current_cart.destroy
      session[:cart_id] = nil
    end
  end

  def order_params
    params.require(:order).permit(:name, :address, :phone, :product_id )
  end
end
