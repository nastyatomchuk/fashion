class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.date :date

      t.timestamps
    end

    add_reference :orders, :user
    add_reference :orders, :cart
  end
end
