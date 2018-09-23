class V1::User::UsersController < UsersApplicationController
  before_action :authenticate_user_request, except: :request_forget_password
  attr_reader :current_user

  # GET /v1/users/1
  def show
    render json: @user
  end

    # PATCH/PUT /v1/users/1
    def update
      if @user.update(user_params)
        render json: { result: true, message: 'The user is successfully updated !!', user: @user}, status: :updated
      else
        render json: {result: false, user: @user.errors }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/users/1
    def update_password
      user = User.find_by_email(params[:email])
      if user.authenticate(params[:password_old])
        if params[:password_new] == params[:password_confirm]
          user.update(password: params[:password_new])
          render json: user
        else
          render json: {message: "Password not same"}
        end
      else
        render json: {result: false, message: "invalid credentials"}
      end
    end

    # PATCH/PUT /v1/users/1
    def request_forget_password
      @user = ::User.find_by_email(params[:email])
      if @user.nil?
        render json:  {result: false, message: "fails request"}, status: 422
      else
        # @user.password =  #=> "52750b"
        @user.update(password: SecureRandom.hex(3) )
        UserMailer.request_forget_password_user(@user, @user.password ).deliver_now
        render json:  {result: true, message: "request forget password success"}
      end
    end

  # reply comment
  def reply_comment
    comment = current_user.comment_replies.new(comment_params)
    if comment.save
      admins = Admin.all
      admins.each do |admin|
        AdminNotification.create(recipient_id: admin.id, actor_id: current_user.id, action: "posted", anotifable: comment)
      end
      render json: {message: "Comment Created", comment: comment}, status: 201
    else
      render json: { error: comment.error }, status: :unprocessable_entity
    end
  end

  def update_fcm_token
     if current_user.update(:fcm_token => params[:fcm_token])
      render json: {status: "OK", message: "Token Device Updated"}
     else
      render json: {status: "Failed", message: "Token Device Fails Updated"}, status: 422
     end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:name, :avatar, :phone_number, :email, :gender, :address, :birth_place, :birth_date)
  end

  def comment_params
    params.permit(:comment_id, :content)
  end

end
