class AddSkuAndRateToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sku, :string
    add_column :products, :rate, :integer
  end
end
