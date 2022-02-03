module Admin
  class CurrencyRatesController < ApplicationController
    before_action :load_rate, only: %i[ show edit update destroy ]

    def index
      @rate = CurrencyRate.order(:rate)
    end

    def new
      @rate = CurrencyRate.new
      @currencies = Currency.order(:country)
    end

    def create
      @rate = CurrencyRate.new(rate_params)

      if @rate.save
        redirect_to admin_currency_rates_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @rate.update(rate_params)
        redirect_to admin_currency_rates_path, notice: "CurrencyRate was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @rate.destroy
      redirect_to admin_currency_rates_path, notice: "CurrencyRate was successfully destroyed."
    end

    private
    def load_rate
      @rate = CurrencyRate.find(params[:id])
    end

    def rate_params
      params.require(:currency_rate).permit(:rate, :currency_id)
    end
  end
end
