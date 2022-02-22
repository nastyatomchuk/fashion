class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, :description, :price, :store_qty, presence: true
end
