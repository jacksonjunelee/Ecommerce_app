class CreateOrderHistory < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.references :product
      t.references :user
      t.references :order
      t.integer :quantity

      t.timestamps
    end
    add_index :order_histories, ["product_id", "user_id", "order_id"]
  end
end
