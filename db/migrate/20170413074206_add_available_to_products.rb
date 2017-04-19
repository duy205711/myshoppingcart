class AddAvailableToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :available, :boolean, default: false
  end
end
