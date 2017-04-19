class AddQuantityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :quantity, :decimal
  end
end
