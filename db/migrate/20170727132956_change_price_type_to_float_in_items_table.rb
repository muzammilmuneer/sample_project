class ChangePriceTypeToFloatInItemsTable < ActiveRecord::Migration
  def change
    change_column :items, :price, :float
  end
end
