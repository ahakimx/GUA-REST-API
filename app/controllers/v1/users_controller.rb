class V1::UsersController < AdminsApplicationController
  before_action :authenticate_admin_request, only: [:index, :show, :destory]
  before_action :authenticate_user_request, only: [:reply_comment]
  before_action :set_user, only: [:update, :destroy, :show, :request_forget_password]

  attr_reader :current_user
  # GET /v1/users
  def index
    users = ::User.all
    render json: users, status: :ok
  end

  # GET /v1/users/1
  def show
    render json: @user
  end

  # POST /v1/users
  def create
    @user = ::User.new(user_params)
    @user.password = SecureRandom.hex(3) #=> "52750b"
    if @user.save
      UserMailer.create_user(@user, @user.password ).deliver_now
      render json: {result: true, message: "created user success", user: @user}, status: 201
    else
      render json:  {result: false, message: "fails create", errors: @user.errors}, status: 422
    end
  end

  # PATCH/PUT /v1/users/1
  def update
    if @user.update(user_params)
      render json: { result: true, message: 'The user is successfully updated !!', user: @user}
    else
      render json: {result: false, user: @user.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /v1/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = ::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :avatar, :phone_number, :email, :gender, :address, :birth_place, :birth_date)
    end

    def comment_params
      params.permit(:comment_id, :content)
    end

end
