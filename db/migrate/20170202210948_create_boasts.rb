class CreateBoasts < ActiveRecord::Migration
  def change
    create_table :boasts do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
