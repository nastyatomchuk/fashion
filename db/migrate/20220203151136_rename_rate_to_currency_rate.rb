class RenameRateToCurrencyRate < ActiveRecord::Migration[6.1]
  def change
    rename_table :rates, :currency_rates
  end
end
