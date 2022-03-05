class HomeController < ApplicationController
  def index
    @products = Product.order(:id)
                       .joins(:stores).where("quantity > 0").uniq.last(16)

    @cart_item = current_cart.cart_items.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def about
  end
end
