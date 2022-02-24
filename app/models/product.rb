class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader

  validates :title, :description, :price, :store_qty, :sku, presence: true
  validates :rate,  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  has_many :cart_items
end
