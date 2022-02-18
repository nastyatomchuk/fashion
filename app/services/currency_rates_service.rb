class CurrencyRatesService
  def initialize(required_currencies)
    @required_currencies = required_currencies
  end

  def call
    currency_rates = RequestCurrentCurrencyRatesService.new.get_currency_rates
    if currency_rates['result'] == 'success'
      required_currency_rates = currency_rates['conversion_rates'].slice(*required_currencies)
      required_currency_rates.each_pair do |code, rate|
        currency_attrs = {source: 'RUB', target: code, rate: rate, rate_date: Date.today}
        CurrencyRate.create(currency_attrs)
      end
    end
  end

  private

  attr_reader :required_currencies
end
