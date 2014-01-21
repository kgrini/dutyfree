class LineItemsController < InheritedResources::Base


  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    @line_item.save

    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def update
    @cart = current_cart

  end

end
