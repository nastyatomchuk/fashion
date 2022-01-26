module Admin
  class UsersController < ApplicationController
    before_action :load_user, only: %i[show edit update destroy]

    def index
      @users = User.all.order(:id)
    end

    def show
    end

    def new
      @user = User.new
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
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        flash.now[:alert] = "User save error"
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_user_path, notice: "User was successfully destroyed."
    end

    private

    def load_user
      @user = User.find.params[:id]
    end

    def user_params
      params.require(:user).permit(:full_name, :phone, :email, :password, :id)
    end
  end
end