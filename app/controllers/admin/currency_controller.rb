module Admin
  class CurrencyController < ApplicationController
    def index
      @currency = Currency.order(:entity)
    end
  end
end
