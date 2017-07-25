class FixColumnName < ActiveRecord::Migration
  def change
    def self.up
      rename_column :users, :roll_id, :role_id
    end
  end
end
