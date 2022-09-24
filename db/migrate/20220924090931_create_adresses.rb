class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.integer :customer_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :adress, null: false
      
      t.timestamps
    end
  end
end
