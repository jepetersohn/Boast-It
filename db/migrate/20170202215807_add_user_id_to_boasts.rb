class AddUserIdToBoasts < ActiveRecord::Migration
  def change
    add_column :boasts, :user_id, :integer
    add_index :boasts, :user_id
  end
end
