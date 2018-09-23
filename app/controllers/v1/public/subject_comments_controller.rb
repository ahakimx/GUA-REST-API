class V1::Public::SubjectCommentsController < UsersApplicationController
  def index
    subject_comments = SubjectComment.all
    render json: {message: "all data", data: subject_comments}, status: 200
  end
end
