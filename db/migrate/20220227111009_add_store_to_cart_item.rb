class AddStoreToCartItem < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :unit_size, :string
    add_reference :cart_items, :store
  end
end
