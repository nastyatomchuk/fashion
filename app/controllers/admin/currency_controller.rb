module Admin
  class CurrencyController < ApplicationController
    def index
      @currency = Currency.order(:entity)
    end

    def new
      @currency = Currency.new
    end

    def create
      @currency = Currency.new(currency_params)
      if @currency.save
        redirect_to @currency
      else
        render :new
      end
    end

    private
    def load_currency
      @currency = Currency.find(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:entity, :currency, :alphabetic_code)
    end
  end
end
