module Admin
  class CategoriesController < AdminController
    before_action :load_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.order(:name)
      authorize @categories
    end

    def show
    end

    def new
      @category = Category.new
      authorize @category
    end

    def edit
    end

    def create
      @category = Category.new(category_params)
      authorize @category
      if @category.save
        redirect_to admin_categories_path, notice: "Категория добавлена."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @category
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: "Категория обновлена."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @category
      if @category.destroy
      redirect_to admin_categories_path, notice: "Категория удалена."
      else
        render :index, status: :unprocessable_entity
      end
    end

    private
    def load_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
