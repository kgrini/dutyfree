class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :description
      t.string :images

      t.timestamps
    end
  end
end
