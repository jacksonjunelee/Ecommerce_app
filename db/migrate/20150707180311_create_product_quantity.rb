class CreateProductQuantity < ActiveRecord::Migration
  def change
    create_table :product_quantities do |t|
      t.references :product
      t.references :user
      t.integer :quantity

      t.timestamps
    end
      add_index :product_quantities, ["product_id", "user_id"]
  end
end
