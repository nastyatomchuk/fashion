module Admin
  class CurrencyRatesController < ApplicationController
    before_action :load_currency_rate, only: %i[ show edit update destroy ]
    layout 'admin'

    def index
      @currency_rates = CurrencyRate.order(:rate_date)
    end

    def new
      @currency_rates = CurrencyRate.new
      @currencies = Currency.order(:country)
    end

    def create
      @currency_rates = CurrencyRate.new(currency_rate_params)

      if @currency_rates.save
        redirect_to admin_currency_rates_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @currency_rates.update(currency_rate_params)
        redirect_to admin_currency_rates_path, notice: "Currency rate was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @currency_rates.destroy
      redirect_to admin_currency_rates_path, notice: "Currency rate was successfully destroyed."
    end

    private
    def load_currency_rate
      @currency_rates = CurrencyRate.find(params[:id])
    end

    def currency_rate_params
      params.require(:currency_rate).permit(:rate, :source, :target, :rate_date)
    end
  end
end
