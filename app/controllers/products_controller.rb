class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.new
    @stores = Store.all.where(product_id: @product.id)
  end

  def index
    @products = Product.search(params[:search])
    @categories = Category.order(:name)
  end

  def product_params
    params.require(:product).permit(:title, :description, {images: []}, :price, :sku, :rate, :category_id)
  end
end
