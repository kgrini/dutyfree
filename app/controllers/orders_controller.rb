class OrdersController < ApplicationController

  #before_filter :authenticate_admin_user!, :only => [:create, :edit, :update, :destroy]
  before_action :set_category, :only => [:show, :edit, :update, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index, :show]


  def index
    @cart = current_cart
    @order = Order.new
  end
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path
      flash[:error] = "Ваша корзина пуста"
    end

    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      flash[:success] = "Заказ отправлен"
      redirect_to root_path
      @cart = current_cart.destroy
      session[:cart_id] = nil
    else
      @cart = current_cart
      render :new
    end
  end

  def order_params
    params.require(:order).permit(:name, :address, :phone, :email )
  end

  def add_line_items_from_cart

  end
end
