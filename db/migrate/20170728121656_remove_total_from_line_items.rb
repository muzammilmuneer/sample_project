class RemoveTotalFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :total
  end
end
