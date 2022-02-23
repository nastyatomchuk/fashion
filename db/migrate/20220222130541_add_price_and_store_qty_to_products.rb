class AddPriceAndStoreQtyToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :decimal
    add_column :products, :store_qty, :integer
  end
end
