module Admin
  class CurrenciesController < AdminController
    def index
      @currencies = Currency.order(:country)
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
      params.require(:currency).permit(:country, :name, :code)
    end
  end
end
