class AddRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.decimal :rate, precision: 7, scale: 4

      t.timestamps
    end
    add_reference :rates, :currency
  end
end
