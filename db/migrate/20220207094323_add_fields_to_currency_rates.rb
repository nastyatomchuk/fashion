class AddFieldsToCurrencyRates < ActiveRecord::Migration[6.1]
  def change
    add_column(:currency_rates, :source_id, :integer)
    add_column(:currency_rates, :target_id, :integer)
    add_column(:currency_rates, :rate_date, :datetime)

  end
end
