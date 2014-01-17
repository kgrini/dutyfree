class CreateSalesRules < ActiveRecord::Migration
  def change
    create_table :sales_rules do |t|
      t.text :description

      t.timestamps
    end
  end
end
