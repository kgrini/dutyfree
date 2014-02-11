module ProductsHelper
  def show_products
    @products= Product.order("created_at DESC").paginate(:page => params[:page].to_i + 1, :per_page => 12)
  end

end
