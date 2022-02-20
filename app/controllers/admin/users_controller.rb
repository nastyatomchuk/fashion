module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :load_user, only: %i[show edit update destroy]
    layout 'admin'

    def index
      @users = User.order(:full_name)
      authorize @users
    end

    def show
    end

    def new
      @user = User.new
      authorize @user
    end

    def edit
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, notice: "User was successfully created."
      else
        flash.now[:alert] = "User save error"
        render :new
      end
    end

    def update
      authorize @user
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        flash.now[:alert] = "User save error"
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @user
      @user.destroy
      redirect_to admin_user_path, notice: "User was successfully destroyed."
    end

    private

    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :phone, :email, :password, :id)
    end
  end
end
