class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :remote_id
      t.integer :inventory_count, :default => 0
      t.datetime :inventory_count_lastupdated

      t.timestamps null: false
    end
  end
end
