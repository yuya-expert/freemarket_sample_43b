class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :category

    add_reference :products, :user
    add_reference :products, :brand
    add_reference :products, :category
  end
end
