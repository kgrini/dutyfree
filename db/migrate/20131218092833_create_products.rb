class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :size
      t.integer :price
      t.belongs_to :categories, polymorphic: true

      t.timestamps
    end
    add_index :products, [:categories_id, :categories_type]
  end
end
