class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :phone
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
