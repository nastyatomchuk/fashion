class CartItemsController < ApplicationController
  before_action :load_cart

  def create
    @cart_item = @cart.cart_items.new(cart_params)
    @cart.save
    session[:cart_id] = @cart.id
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update(cart_params)
    @cart_items = current_cart.cart_items
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_cart.cart_items
  end

  private
  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def load_cart
    @cart = current_cart
  end
end
