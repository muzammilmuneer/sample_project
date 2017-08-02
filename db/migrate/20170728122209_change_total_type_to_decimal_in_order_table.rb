class ChangeTotalTypeToDecimalInOrderTable < ActiveRecord::Migration
  def change
    change_column :orders, :total_amount, :decimal, precision: 10, scale: 2
  end
end
