class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :store
  belongs_to :cart


  before_save :set_unit_price
  before_save :set_unit_size
  before_save :set_total
  before_save :set_quantity

  after_destroy :set_store_qty

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def unit_size
    if persisted?
      self[:unit_size]
    else
      store.size
    end
  end

  def total
    unit_price * quantity
  end

  private

  def set_quantity
    self[:quantity] = quantity?
  end

  def set_store_qty
    store.update(quantity: store.quantity + quantity)
  end

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_unit_size
    self[:unit_size] = unit_size
  end

  def set_total
    self[:total] = total * quantity
  end

  def quantity?
    if quantity <= store.quantity
      store.update(quantity: store.quantity - quantity)
      quantity
    else
      throw :abort
    end
  end
end
