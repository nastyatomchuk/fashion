class OrderController < ApplicationController

  def index
    @cart_items = current_cart.cart_items
    @cart = current_cart
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to home_index_path, notice: "Заказ оформлен, проверьте почту."
      OrderMailer.with(order: @order).new_order_email.deliver_now
    end
  end

  private
  def order_params
    params.permit(:total, :date, :user_id, :cart_id)
  end
end
