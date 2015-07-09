class ChangeFloatFormatToStringOrders < ActiveRecord::Migration
  def change
    change_column :orders, :total, :string
  end
end
