class CurrencyController < ApplicationController
  def index
    @currency = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(product_params)
    if @currency.save
      redirect_to @currency
    else
      render :new
    end
  end

  private
  def set_product
    @currency = Currency.find(params[:id])
  end

  def product_params
    params.require(:currency).permit(:entity, :currency, :alphabetic_code)
  end
end
