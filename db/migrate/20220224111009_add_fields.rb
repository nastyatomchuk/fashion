class AddFields < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :subtotal, :decimal
    add_column :cart_items, :total, :decimal
    add_column :cart_items, :unit_price, :decimal
  end
end
