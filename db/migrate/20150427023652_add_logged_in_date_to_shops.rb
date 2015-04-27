class AddLoggedInDateToShops < ActiveRecord::Migration
  def change
    add_column :shops, :last_login_at, :datetime
  end
end
