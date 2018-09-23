class V1::AdminsController < AdminsApplicationController
  before_action :authenticate_admin_request, except: :create
  attr_reader :current_admin
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /v1/admins
  def index
    admins = Admin.all
    render json: admins
  end

  # GET /v1/admins/1
  def show
    render json: @admin
  end

  # POST /vu61/admins
  def create
    admin = Admin.new(admin_params)
    admin.save ? (render json: admin, status: :created) : (render json: admin.errors, status: :unprocessable_entity)
  end

  # PATCH/PUT /v1/admins/1
  def update
    @admin.update(admin_params) ? (render json: @admin) : (render json: @admin.errors, status: :unprocessable_entity)
  end

  # DELETE /v1/admins/1
  def destroy
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.permit(:name, :username, :password)
    end

end
