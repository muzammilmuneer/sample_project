class FixUserColumnName < ActiveRecord::Migration
  def change
    rename_column :orders, :creater_id, :user_id
  end
end
