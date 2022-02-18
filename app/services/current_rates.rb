class CurrentRates < BusinessProcess::Base
  APIURL = "https://v6.exchangerate-api.com/v6/ec413f9db2bc5615cada646a/pair/RUB/"

  def initialize(source_currency)
    @source_currency = source_currency
  end

  def call
    new.get_data
  end

  private

  def get_api(api)
    CurrentCurrencyRatesService.new(api).get_currency_rates
  end

  def get_data
    source_currency.each do |currency|
      api_path = APIURL + currency.code

      if get_api(api_path)["result"] == "success"
        сurrency_attrs = {source: "RUB", target: currency.code, rate: get_api(api_path)["conversion_rate"], rate_date: Date.today}
        CurrencyRate.create!(сurrency_attrs)
      else
        currency.code + " " + get_api(api_path)["error-type"]
      end
    end
  end
end
