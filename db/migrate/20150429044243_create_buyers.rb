class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :email
      t.text :note
      t.integer :raise, :default => 0
      t.string :state, :default => "new"

      t.timestamps null: false
    end
  end
end
