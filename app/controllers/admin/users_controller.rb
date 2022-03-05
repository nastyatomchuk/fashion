module Admin
  class UsersController < AdminController
    before_action :authenticate_user!
    before_action :load_user, only: %i[show edit update destroy]

    def index
      @users = User.order(:full_name)
      authorize @users
    end

    def new
      @user = User.new
      authorize @user
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      authorize @user
      if @user.save
      else
        flash.now[:alert] = "Ошибка сохранения пользователя."
        render :new
      end
    end

    def update
      authorize @user
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Пользователь обновлен."
      else
        flash.now[:alert] = "Ошибка сохранения пользователя."
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @user
      @user.destroy
      redirect_to admin_users_path, notice: "Пользователь удален."
    end

    private

    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :phone, :email, :password, :password_confirmation)
    end
  end
end
