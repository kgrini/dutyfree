class CartsController < InheritedResources::Base
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def index
    redirect_to root_path
  end

  def edit
    redirect_to root_path
  end

  def show
    show_cart_wih_exception
    @cart = current_cart
    @line_item = @cart.line_items
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to(root_path,
                                :notice => 'Your cart is currently empty' ) }
      format.xml { head :ok }
    end

  end

  def show_cart_wih_exception
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, :notice => "Корзины не существует"
    else
      @cart = Cart.find(params[:id])
    end
  end
end
