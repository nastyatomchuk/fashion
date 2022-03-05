class CategoryController < ApplicationController
  def show

    @categories = Category.order(:name)
    @cart_item = current_cart.cart_items.new

    if params[:size].blank?
      @products = Product.all.where(category_id: params[:id])
                         .joins(:stores).where("quantity > 0").uniq
    else
      @products = size(params[:size])
    end
  end

  def index
    @products = Product.search(params[:search])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, {images: []}, :price, :sku, :rate, :category_id)
  end
end
