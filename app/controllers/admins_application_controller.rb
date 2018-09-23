class AdminsApplicationController < ApplicationController
  protected
  def authenticate_admin_request
      @current_admin = AuthorizeAdminApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_admin
  end
end
