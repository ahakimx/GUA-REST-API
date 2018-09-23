class V1::CommentRepliesController < AdminsApplicationController
  before_action :authenticate_admin_request
  before_action :set_comment_reply, only: [:show, :destroy]
  attr_reader :current_admin
  include PushNotificationHelper

  # GET /v1/comment_replies
  def index
    comment_replies = CommentReply.all

    render json: comment_replies
  end

  # GET /v1/comment_replies/1
  def show
    render json: @comment_reply
  end

  # DELETE /v1/comment_replies/1
  def destroy
    @comment_reply.destroy
  end

  # reply comment
  def reply_comment_user
    comment = current_admin.comment_replies.new(comment_params)
    if comment.save
      comment_user = Comment.find(params[:comment_id])
      user = ::User.find(comment_user.user_id)
      push_notification(user.fcm_token, 'Komentar anda dibalas', comment.content)
      UserNotification.create(recipient_id: user.id, actor_id: current_admin.id, action: "posted", 
        unotifable: comment, category: 3, title: "Balasan komentar", content: "Balasan komentar dari admin")
      render json: {message: "Comment Created", comment: comment}, status: 201
    else
      render json: { error: comment.error }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_reply
      @comment_reply = CommentReply.find(params[:id])
    end
    def comment_params
      params.permit(:comment_id, :content)
    end
end
