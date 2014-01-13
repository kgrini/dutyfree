class CartsController < InheritedResources::Base
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def show
    @cart = Cart.find(params[:id])
  end
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to(orders_path,
                                :notice => 'Your cart is currently empty' ) }
      format.xml { head :ok }
    end

  end
end
