class OrdersController < ApplicationController

  def new
  end

  def create
    @order = Order.new(order_params)
    if order.save
      flash[:success] = "Заказ отправлен"
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order).permit(:name, :address, :phone )
  end
end
