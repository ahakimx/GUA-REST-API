class V1::PromosController < AdminsApplicationController
  before_action :authenticate_admin_request
  attr_reader :current_admin
  before_action :set_promo, only: [:show, :update, :destroy]

  # GET /v1/promos
  def index
    promos = Promo.where("due_date >= ?", Time.now).order("created_at desc")
    promos.blank? ? (render json: {message: "there is no data"}, status: :ok) : 
    (render json: {message: "data all promo", promos: promos}, status: :ok)
  end

  # GET /v1/promos/1
  def show
    render json: @promo
  end

  # POST /v1/promos
  def create
    promo = Promo.new(promo_params)
    promo.update_attribute(:admin_id, current_admin.id)
    promo.slug = promo.title.parameterize
    if promo.save
      PushnotifUserPromoJob.set(wait: 1.minutes).perform_later(promo)
      NotifUserPromoJob.set(wait: 1.minutes).perform_later(promo, current_admin)
      render json: promo, status: :created
    else
      render json: promo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/promos/1
  def update
    if @promo.update(promo_params)
      render json: @promo
    else
      render json: @promo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/promos/1
  def destroy
    @promo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def promo_params
      params.permit(:title,:content,:due_date,:image)
    end

end
