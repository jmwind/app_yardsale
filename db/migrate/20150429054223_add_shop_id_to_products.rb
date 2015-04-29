class AddShopIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shop_id, :integer
    add_index :products, :shop_id
  end
end
