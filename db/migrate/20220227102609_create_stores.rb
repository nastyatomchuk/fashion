class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :size
      t.integer :quantity

      t.timestamps
    end
    add_reference :stores, :product
  end
end
