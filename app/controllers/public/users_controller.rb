module Public
  class UsersController < BaseController
    load_and_authorize_resource

    def index
      render json: @users
    end

    def show
      render json: @user
    end

    def create
      @user.save!
      render json: @user, status: :created, location: @user
    end

    def update
      @user.update! user_params
      render json: @user, location: @user
    end

    def destroy
      @user.destroy
      head 204
    end

    def profile
      @user = current_user
      @user.update! user_params if request.method == 'PATCH'
      render json: @user, location: @user
    end

    private

    def user_params
      params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
    end

  end
end
