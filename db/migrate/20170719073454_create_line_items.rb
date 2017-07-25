class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :order, index: true
      t.integer :order_id
      t.integer :item_id
      t.timestamps
    end
  end
end
