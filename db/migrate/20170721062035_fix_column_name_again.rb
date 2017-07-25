class FixColumnNameAgain < ActiveRecord::Migration
  def change
    rename_column :users, :roll_id, :role_id
  end
end
