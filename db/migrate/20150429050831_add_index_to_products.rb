class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :remote_id, :unique => true
  end
end
