class AddRatesToCurrencies < ActiveRecord::Migration[6.1]
  def change
    add_reference :rates, :currencies
  end
end
