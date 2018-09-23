class V1::AgentsController < AdminsApplicationController
  before_action :authenticate_admin_request
  before_action :set_agent, only: [:show, :update, :destroy, :update_avatar]

  # GET /v1/agents
  def index
    agents = Agent.all
    render json: agents
  end

  # GET /v1/agents/1
  def show
    render json: @agent
  end

  # POST /v1/agents
  def create
    agent = Agent.new(agent_params)
    agent.save ? (render json: {message: "created success", agent: agent}, status: 201) : 
    (render json:  {message: "fails create", errors: agent.errors}, status: 422)
  end

  # PATCH/PUT /v1/agents/1
  def update
    @agent.update(agent_params) ? (render json: @agent) : 
    (render json: @agent.errors, status: :unprocessable_entity)
  end

  def update_avatar
    @agent.update(:avatar => params[:avatar]) ? (render json: @agen) : 
    (render json: @agent.errors, status: :unprocessable_entity)
  end


  # DELETE /v1/agents/1
  def destroy
    @agent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agent_params
      params.permit(:name, :phone_number, :email, :avatar, :address, :gender, :birth_place, :birth_date)
    end

end
