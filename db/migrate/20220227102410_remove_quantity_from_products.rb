class RemoveQuantityFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :store_qty, :integer
  end
end
