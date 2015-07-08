class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :state
      t.string :city
      t.string :zipcode
      t.float :total
      t.references :user
    end
  end
end
