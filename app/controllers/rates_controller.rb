class RatesController < ApplicationController
  before_action :set_rate, only: %i[ show edit update destroy ]

  def index
    @rate = Rate.all
  end

  def new
    @rate = Rate.new
    @currencies = Currency.all
  end


  def create
    @rate = Rate.new(rate_params)

    if @rate.save
      redirect_to rates_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rate.update(rate_params)
      redirect_to rates_path, notice: "Rate was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
  def set_rate
    @rate = Rate.find(params[:id])
  end

  def rate_params
    params.require(:rate).permit(:rate, :currency_id)
  end
end
