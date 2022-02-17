require 'net/http'
require 'json'

class Current_Currency_Rates_Service
  attr_reader :api_url, :rates

  def initialize(api_url)
    @api_url = api_url
    @rates = Currency.order(:country)
  end

  def get_currency_rates
    uri = URI(@api_url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
