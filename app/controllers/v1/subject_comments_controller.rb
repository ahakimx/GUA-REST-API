class V1::SubjectCommentsController < AdminsApplicationController
  before_action :authenticate_admin_request, only: [:create, :update, :destroy]
  before_action :set_subject_comment, only: [:show, :update, :destroy]

  # GET /v1/subject_comments
  def index
    subject_comments = SubjectComment.all

    render json: subject_comments
  end

  # GET /v1/subject_comments/1
  def show
    render json: @subject_comment
  end

  # POST /v1/subject_comments
  def create
    subject_comment = SubjectComment.new(subject_comment_params)
    subject_comment.slug = subject_comment.name.parameterize
    if subject_comment.save
      render json: subject_comment, status: :created
    else
      render json: subject_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/subject_comments/1
  def update
    if @subject_comment.update(subject_comment_params)
      render json: @subject_comment
    else
      render json: @subject_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/subject_comments/1
  def destroy
    @subject_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_comment
      @subject_comment = SubjectComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_comment_params
      params.permit(:name)
    end

end
