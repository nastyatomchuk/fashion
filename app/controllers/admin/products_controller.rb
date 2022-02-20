module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_product, only: %i[ show edit update destroy ]

    layout 'admin'

    def index
      @products = Product.order(:title)
      authorize @products
    end

    def show
    end

    def new
      @product = Product.new
      authorize @product
    end

    def edit
    end

    def create
      @product = Product.new(product_params)
      authorize @product
      if @product.save
        redirect_to admin_products_path, notice: "Product was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @product
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "Product was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @product
      @product.destroy
      redirect_to admin_products_path, notice: "Product was successfully destroyed."
    end

    private
      def load_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :description, :image)
      end
  end
end
