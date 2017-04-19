class AddPackageToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :package, :boolean, default: false
  end
end
