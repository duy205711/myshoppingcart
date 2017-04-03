class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :user_id
      t.string :name
      t.float :total_prices
      t.integer :total_products
      t.string :email
      t.text :address
      t.integer :address_type
      t.string :phone
      t.text :info
      t.integer :payment_type
      t.integer :delivery_type
      t.float :delivery_fee
      t.boolean :receipt_required
      t.datetime :delivery_time_min
      t.datetime :delivery_time_max
      t.integer :status
      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :email
    add_index :orders, :order_number
  end
end
