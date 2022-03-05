module Admin
  class StoresController < AdminController

    before_action :authenticate_user!
    before_action :load_product, only: %i[ show edit update destroy ]

    def index
      @stores = Store.order(:product_id)
      authorize @stores
    end

    def show
    end

    def new
      @store = Store.new
      authorize @store
    end

    def edit
    end

    def create
      @store = Store.new(store_params)
      authorize @store
      if @store.save
        redirect_to admin_stores_path, notice: "Запись на складе создана."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @store
      if @store.update(store_params)
        redirect_to admin_stores_path, notice: "Запись на складе обновлена."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @store
      @store.destroy
      redirect_to admin_stores_path, notice: "Запись на складе удалена."
    end

    private
    def load_product
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:size, :quantity, :product_id)
    end
  end
end
