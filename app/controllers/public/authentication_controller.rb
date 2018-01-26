module Public
  class AuthenticationController < BaseController
    skip_before_action :authenticate_request

    def authenticate
      command = AuthenticateUser.call(user_params)

      if command.success?
        render json: { auth_token: command.result }, status: :created
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
