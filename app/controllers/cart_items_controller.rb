class CartItemsController < ApplicationController
  before_action :load_cart

  def create
    @cart = current_cart
    @cart_item = @cart.cart_items.new(cart_params)

    if @cart.save
      session[:cart_id] = @cart.id
      redirect_to cart_path
      flash.notice = "Товар добавлен в корзину."
    else
      redirect_to product_path(@cart_item.product)
      flash.notice = "Недостаточное количество товара на складе."
    end

  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update(cart_params)
    @cart_items = current_cart.cart_items
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_cart.cart_items
    redirect_to cart_path, notice: "ТОвар удален из корзины."
  end

  private
  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity, :store_id)
  end

  def load_cart
    @cart = current_cart
  end
end
