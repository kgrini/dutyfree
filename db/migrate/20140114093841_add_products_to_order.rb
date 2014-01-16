class AddProductsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product_id, :integer
    add_column :orders, :product_name, :string
    add_column :orders, :product_quantity, :integer, :default => 1
  end
end
