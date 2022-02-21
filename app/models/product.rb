class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :description, presence: true
  has_many :cart_items
  belongs_to :category
end
