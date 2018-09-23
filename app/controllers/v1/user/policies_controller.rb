class V1::User::PoliciesController < UsersApplicationController
  before_action :authenticate_user_request
  attr_reader :current_user

  def my_policies
    @current_user
  end
end
