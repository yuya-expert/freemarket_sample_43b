class Users < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_ja, :string
    add_column :users, :first_name_ja, :string
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :integer
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :building, :string
    add_column :users, :phone_number, :string
    add_column :users, :birthday, :date
    add_column :users, :self_introduction, :text
    add_column :users, :image, :string
  end
end
