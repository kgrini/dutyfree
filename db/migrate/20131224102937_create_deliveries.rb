class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.text :description

      t.timestamps
    end
  end
end
