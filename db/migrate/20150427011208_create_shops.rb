class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :url
      t.string :shop_id
      t.string :api_token
      t.string :oauth_token
      t.text :settings
      t.string :status
      t.string :name
      t.string :owner
      t.string :email

      t.timestamps null: false
    end
    add_index :shops, :url, :unique => true
    add_index :shops, :shop_id, :unique => true
  end
end
