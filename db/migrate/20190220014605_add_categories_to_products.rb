class AddCategoriesToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :top_category_id, :integer, null: false
    add_column :products, :middle_category_id, :integer, null: false
  end
end
