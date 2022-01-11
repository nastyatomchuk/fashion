class RateController < ApplicationController
  def index
    @rate = Rate.all
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(product_params)
    if @rate.save
      redirect_to @rate
    else
      render :new
    end
  end

  private
  def set_product
    @rate = Rate.find(params[:id])
  end

  def product_params
    params.require(:rate).permit(:currencies_id)
  end
end
