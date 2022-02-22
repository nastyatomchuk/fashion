class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader

  validates :title, :description, :price, :store_qty, presence: true
end
