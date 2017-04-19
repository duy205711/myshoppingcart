class AddQuantityToCartProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_products, :quantity, :decimal
  end
end
