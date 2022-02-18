require 'net/http'
require 'json'

class CurrentCurrencyRatesService
  attr_reader :api_url, :rates

  def initialize(api_url)
    @api_url = api_url
  end

  def get_currency_rates
    uri = URI(@api_url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
