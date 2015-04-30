class ChangeBuyersRaiseToDecimal < ActiveRecord::Migration
  def change
    change_column :buyers, :raise, :decimal, :precision => 7, :scale => 2
  end
end
