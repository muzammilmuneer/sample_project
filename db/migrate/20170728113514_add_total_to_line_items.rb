class AddTotalToLineItems < ActiveRecord::Migration
  def change
        add_column :line_items, :total, :decimal, precision: 10, scale: 2
  end
end
