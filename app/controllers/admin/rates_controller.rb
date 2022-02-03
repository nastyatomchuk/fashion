module Admin
  class RatesController < ApplicationController
    before_action :load_rate, only: %i[ show edit update destroy ]

    def index
      @rate = Rate.order(:rate)
    end

    def new
      @rate = Rate.new
      @currencies = Currency.order(:country)
    end

    def create
      @rate = Rate.new(rate_params)

      if @rate.save
        redirect_to admin_rates_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @rate.update(rate_params)
        redirect_to admin_rates_path, notice: "Rate was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @rate.destroy
      redirect_to admin_rates_path, notice: "Rate was successfully destroyed."
    end

    private
    def load_rate
      @rate = Rate.find(params[:id])
    end

    def rate_params
      params.require(:rate).permit(:rate, :currency_id)
    end
  end
end
