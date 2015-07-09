class AddUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :url, :text
  end
end
