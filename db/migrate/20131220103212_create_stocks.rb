class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.text :description
      t.string :images

      t.timestamps
    end
  end
end
