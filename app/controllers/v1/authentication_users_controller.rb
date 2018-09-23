class V1::AuthenticationUsersController < ApplicationController
    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])
        command.success? ? (user = User.find_by_email(params[:email]) 
            render json: { auth_token: command.result, user: user }) : 
            (render json: { error: command.errors }, status: :unauthorized)
    end
end