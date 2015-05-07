class RemoveIndexEmailFromBuyers < ActiveRecord::Migration
  def change
    remove_index :buyers, :email
    add_index :buyers, [:product_id, :email], :unique => true
  end
end
