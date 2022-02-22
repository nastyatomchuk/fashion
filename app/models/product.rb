class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader

  validates :title, :description, :price, :store_qty, :sku, :rate, presence: true
  validates :rate,  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
