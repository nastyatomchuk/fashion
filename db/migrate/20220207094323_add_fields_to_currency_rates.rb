class AddFieldsToCurrencyRates < ActiveRecord::Migration[6.1]
  def change
    add_column(:currency_rates, :source, :string)
    add_column(:currency_rates, :target, :string)
    add_column(:currency_rates, :rate_date, :date)

  end
end
