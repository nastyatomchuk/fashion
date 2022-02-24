class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  before_save :set_quantity
  after_destroy :set_store_qty

  def quantity?
    if quantity < product.store_qty
      product.update(store_qty: product.store_qty - quantity)
      quantity
    else
      throw :abort
    end
  end

  private

  def set_quantity
    self[:quantity] = quantity?
  end

  def set_store_qty
    product.update(store_qty: product.store_qty + quantity)
  end
end
