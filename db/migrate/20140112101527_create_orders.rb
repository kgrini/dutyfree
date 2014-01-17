class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :phone
      t.string :name
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
