require 'net/http'
require 'json'

module RateHelper
  def currency_rate(conversion_rate)
    # Setting URL
    url = "https://v6.exchangerate-api.com/v6/ec413f9db2bc5615cada646a/latest/RUB"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    # Getting a rate
    rate = response_obj['conversion_rates'][conversion_rate]
  end
end
