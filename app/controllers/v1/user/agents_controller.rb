class V1::User::AgentsController < UsersApplicationController
  before_action :authenticate_user_request
  before_action :set_agent, only: [:show]
  attr_reader :current_user

  def show
    render json: @agent
  end

  def all_agents_user
    render json: current_user.agents
  end


  private
    def set_agent
      @agent = Agent.find(params[:id])
    end
end
