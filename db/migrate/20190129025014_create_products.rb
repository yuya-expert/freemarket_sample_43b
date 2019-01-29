class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string              :name,            null: false
      t.text                :detail,          null: false
      t.integer             :status,          null: false
      t.integer             :delivery_fee,    null: false
      t.integer             :area,            null: false
      t.integer             :shipping_dates,  null: false
      t.integer             :price,           null: false
      t.integer             :delivery_status, null: false, default: "出品中"
      # t.references          :user,            foreign_key: true
      # t.references          :brand,           foreign_key: true
      # t.references          :category,        foreign_key: true
      t.timestamps
    end
  end
end
