module Admin
  class CurrencyRatesController < ApplicationController
    before_action :load_currency_rate, only: %i[ show edit update destroy ]

    def index
      @currency_rate = CurrencyRate.order(:rate)
    end

    def new
      @currency_rate = CurrencyRate.new
      @currencies = Currency.order(:country)
    end

    def create
      @currency_rate = CurrencyRate.new(rate_params)

      if @currency_rate.save
        redirect_to admin_currency_rates_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @currency_rate.update(rate_params)
        redirect_to admin_currency_rates_path, notice: "CurrencyRate was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @currency_rate.destroy
      redirect_to admin_currency_rates_path, notice: "CurrencyRate was successfully destroyed."
    end

    private
    def load_currency_rate
      @currency_rate = CurrencyRate.find(params[:id])
    end

    def rate_params
      params.require(:currency_rate).permit(:rate, :currency_id)
    end
  end
end
