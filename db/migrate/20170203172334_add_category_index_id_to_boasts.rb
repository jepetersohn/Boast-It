class AddCategoryIndexIdToBoasts < ActiveRecord::Migration
  def change
    add_index :boasts, :category_id
  end
end

