class Store < ApplicationRecord
  belongs_to :product
  has_many :cart_items

  validates :size, :quantity, presence: true
end
