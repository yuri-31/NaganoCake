class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, foreign_key: true
      t.string :delivery_postal_code, null: false
      t.string :delivery_adress, null: false
      t.string :delivery_name, null: false
      t.integer :shipping_fee, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
