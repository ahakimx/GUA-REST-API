class UsersApplicationController < ApplicationController
  protected
  def authenticate_user_request
      @current_user = AuthorizeUserApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
