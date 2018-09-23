class V1::CommentsController < AdminsApplicationController
  before_action :authenticate_admin_request
  attr_reader :current_admin

  def index
    comments = Comment.all
    render json: comments
  end

  def show_comment_and_replies
    @comments = Comment.find(params[:id])
  end


end
