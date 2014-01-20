class Order < ActiveRecord::Base

  has_many :carts
  has_many :line_items, :dependent => :destroy

  validates :name, :presence => true, :length => {:minimum => 4, :maximum => 20}
  validates :address, :presence => true, :length => {:minimum => 4, :maximum => 20}
  validates :phone, :presence => true, :length => {:minimum => 4, :maximum => 20}, :numericality => { :only_integer => true}

  VALIDATE_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, :presence => true, :format => { :with => VALIDATE_EMAIL}

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
