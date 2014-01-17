class Order < ActiveRecord::Base

  has_many :carts
  has_many :line_items, :dependent => :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      #item.card_id = nil
      line_items << item
    end
  end
end
