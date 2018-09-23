class V1::User::RequestChangesController < UsersApplicationController
  before_action :set_request_change, only: [:show, :update, :destroy]
  before_action :authenticate_user_request
  attr_reader :current_user

  # GET /v1/request_changes
  def index
    request_changes = RequestChange.all

    render json: request_changes
  end

  # GET /v1/request_changes/1
  def show
    render json: @request_change
  end

  # POST /v1/request_changes
  def create
    request = current_user.request_changes.new(request_change_params)
    if request.save
      admins = ::Admin.all
      admins.each do |admin|
        AdminNotification.create(recipient_id: admin.id, actor_id: current_user.id, action: "posted", anotifable: request)
      end
      agent = Agent.find(params[:agent_id])
      agent.update(:change_request_count => agent.change_request_count== nil ? 1 : agent.change_request_count+1)
      render json: request, status: :created
    else
      render json: request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/request_changes/1
  def update
    if @request_change.update(request_change_params)
      render json: @request_change
    else
      render json: @request_change.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/request_changes/1
  def destroy
    @request_change.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_change
      @request_change = ::RequestChange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_change_params
      params.permit(:agent_id,:reason)
    end

end
