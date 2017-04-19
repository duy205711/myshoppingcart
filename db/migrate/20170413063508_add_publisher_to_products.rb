class AddPublisherToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :publisher, :string
  end
end
