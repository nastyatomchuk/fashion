class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: @order.user.email, subject: "Вы совершили заказ!")
  end
end
