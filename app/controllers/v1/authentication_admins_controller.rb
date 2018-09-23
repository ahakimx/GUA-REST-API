class V1::AuthenticationAdminsController < ApplicationController
    def authenticate
        command = AuthenticateAdmin.call(params[:username], params[:password])
        command.success? ? (admin = Admin.find_by_username(params[:username]) 
            render json: { auth_token: command.result, admin: Admin.find_by_username(params[:username])}) : 
            (render json: { error: command.errors }, status: :unauthorized) 
    end
end