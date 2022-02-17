require_relative 'current_currency_rares_service.rb'

class CurrentRates
  attr_reader :rates, :current_currency_rates_service

  def initialize
    @rates = Currency.order(:country)
    @current_currency_rates_service = current_currency_rates_service
  end

  def get_rates
  end

end
