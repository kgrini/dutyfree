ActiveAdmin.register LineItem do

  belongs_to :order

  index do
    column :id
    column :product_id do |line_item|
      line_item.product.name
    end
    column :quantity
    column :created_at
  end



end
