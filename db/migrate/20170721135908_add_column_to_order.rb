class AddColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :creater_id, :integer
  end
end
