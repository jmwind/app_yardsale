class AddProductIdToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :product_id, :integer
  end
end
