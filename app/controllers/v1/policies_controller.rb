class V1::PoliciesController < AdminsApplicationController
  before_action :authenticate_admin_request
  before_action :set_policy, only: [:show, :update, :destroy, :change_agent_user,:change_policy_user]
  attr_reader :current_admin
  include PushNotificationHelper

  # GET /v1/policies
  def index
    @policies = Policy.all

    render json: @policies
  end

  # GET /v1/policies/1
  def show
    render json: @policy
  end

  def show_user
    policy = Policy.find(3)
    render json: {user: policy.users, agent: policy.agents, kategori: policy.insurance_categories}, status: :ok
  end

  def show_user_agents
    policy = Policy.find_by(agent_id: params[:id])
    render json: {users: policy.users}, status: :ok
  end

  # POST /v1/policies
  def create
    user = ::User.find(params[:user_id])
    policy = user.policies.new(policy_params)
    if policy.save
      render json: policy, status: :created
    else
      render json: policy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/policies/1
  def update
    if @policy.update(policy_params)
      render json: {message: "update success", policies: @policy}
    else
      render json: @policy.errors, status: :unprocessable_entity
    end
  end

  #CHANGE USER'S AGENT
  def change_agent_user
    if @policy.update(policy_params)
      user = ::User.find(@policy.user_id)
      push_notification(user.fcm_token, 'Hai '+user.name, 'Agent Anda Sudah Kami Ganti')
      UserNotification.create(recipient_id: user.id, actor_id: current_admin.id, action: "posted", 
        unotifable: @policy, category: 0, title: "Agen Baru Hadir", content: "Agen siap memberikan pelayanan terbaiknya untuk Anda, sekarang!")
      render json: @policy, status: :ok
    else
      render json: @policy.errors, status: :unprocessable_entity
    end
  end

  def change_policy_user
    if @policy.update(policy_params)
      user = ::User.find(@policy.user_id)
      push_notification(user.fcm_token, 'Hai '+user.name, 'Polis Anda Sudah Kami Update')
      UserNotification.create(recipient_id: user.id, actor_id: current_admin.id, action: "posted", 
        unotifable: @policy, category: 1, title: "Pembaharuan Polis", content: "Polismu telah di update oleh Agen! Silahkan cek polismu sekarang")
      render json: @policy, status: :ok
    else
      render json: @policy.errors, status: :unprocessable_entity
    end
  end


  # DELETE /v1/policies/1
  def destroy
    @policy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy
      @policy = Policy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def policy_params
      params.permit(:user_id, :agent_id, :insurance_category_id, :policy_id, :premium, :insurance_due_date, :policy, :register_date, :premium_date, :guarantee_number)
    end

end
