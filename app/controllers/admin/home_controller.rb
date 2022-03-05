module Admin
  class HomeController < AdminController
    before_action :authenticate_user!
    def index
      @users = User.order(:full_name)
      authorize @users

      @orders = Order.order(:date)
    end
  end
end
