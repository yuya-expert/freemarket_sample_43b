class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :nickname, :string
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name_ja, :string
    remove_column :users, :first_name_ja, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :prefecture, :integer
    remove_column :users, :city, :string
    remove_column :users, :address, :string
    remove_column :users, :building, :string
    remove_column :users, :phone_number, :string
    remove_column :users, :birthday, :date
    remove_column :users, :self_introduction, :text
    remove_column :users, :image, :string
  end
end
