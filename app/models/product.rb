class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :category
  validates :title, :description, :price, :store_qty, :sku, presence: true
  validates :rate,  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
