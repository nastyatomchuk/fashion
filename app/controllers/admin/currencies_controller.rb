module Admin
  class CurrenciesController < ApplicationController
    def index
      @currency = Currency.order(:entity)
    end
  end
end
