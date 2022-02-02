module Admin
  class CurrenciesController < ApplicationController
    def index
      @currencies = Currency.order(:entity)
    end
  end
end
