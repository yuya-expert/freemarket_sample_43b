class CreateDeliveryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :postal_code
      t.string     :prefecture,    null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
