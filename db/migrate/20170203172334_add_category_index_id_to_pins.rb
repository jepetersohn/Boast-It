class AddCategoryIndexIdToPins < ActiveRecord::Migration
  def change
    add_index :pins, :category_id
  end
end

