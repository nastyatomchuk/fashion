class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  after_create :delete_cart_items

  private

  def delete_cart_items
    CartItem.delete_all
  end
end
