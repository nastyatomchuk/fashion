class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :category
  has_many :stores
  has_many :cart_items

  validates :title, :description, :price, :sku, presence: true
  validates :rate,  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  def self.search(search)
    if search
      product = Product.where(title: search)
                  .joins(:stores).where("quantity > 0").uniq
      if product
        self.where(id: product)
      else
        Product.all.joins(:stores).where("quantity > 0").uniq
      end
    else
      Product.all.joins(:stores).where("quantity > 0").uniq
    end
  end
end
