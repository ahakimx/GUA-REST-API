class V1::User::CommentsController < UsersApplicationController
  before_action :authenticate_user_request
  before_action :set_comment, only: [:show, :update, :destroy]
  attr_reader :current_user

  # GET /v1/comments
  def index
    comments = Comment.all
    render json: comments
  end

  # GET /v1/comments/1
  def show
    render json: @comment
  end

  # POST /v1/comments
  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      admins = Admin.all
      admins.each do |admin|
        AdminNotification.create(recipient_id: admin.id, actor_id: current_user.id, action: "posted", anotifable: comment)
      end
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/comments/1
  def destroy
    @comment.destroy
  end

  def show_comment_and_replies
    @comments = Comment.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:subject_comment_id, :agent_id, :content, :rating)
    end

end
