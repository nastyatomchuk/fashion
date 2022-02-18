require 'net/http'
require 'json'

class RequestCurrentCurrencyRatesService
  API_URL = 'https://v6.exchangerate-api.com/v6/ec413f9db2bc5615cada646a/latest/RUB'

  def get_currency_rates
    uri = URI(API_URL)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
