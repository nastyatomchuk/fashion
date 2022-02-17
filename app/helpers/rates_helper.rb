require 'net/http'
require 'json'

module RatesHelper
  def currency_rates
    url = "https://v6.exchangerate-api.com/v6/ec413f9db2bc5615cada646a/latest/RUB"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
