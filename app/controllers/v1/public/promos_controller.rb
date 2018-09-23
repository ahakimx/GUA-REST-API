class V1::Public::PromosController < UsersApplicationController
  before_action :set_promo, only: [:show]

  def index
    promos = Promo.all
    if promos.blank?
      render json: {message: "there is no data"}, status: :ok
    else
      render json: {message: "data all promo", promos: promos}, status: :ok
    end
  end

  def show
    render json: @promo
  end

  private
    def set_promo
      @promo = Promo.find(params[:id])
    end

end
