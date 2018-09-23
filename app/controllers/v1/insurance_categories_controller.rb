class V1::InsuranceCategoriesController < AdminsApplicationController
    before_action :authenticate_admin_request
    before_action :find_insurance_category, only: [:update, :show, :destroy]

    def index
        insurance_categories = InsuranceCategory.all
        render json: {categories: insurance_categories, message: "Data of Categories"}, status: :ok
    end

    def show
        render json: {  result: @insurance_category.blank? ? ["category not found"]  : @insurance_category }, status: :ok
    end

    def create
        insurance_category = InsuranceCategory.new(insurance_category_params)
        insurance_category.slug = insurance_category.name.parameterize
        if insurance_category.save
            render json: {  result: insurance_category }, status: 201
        else
            render json: { result: ["Failed creating new Category"], errors: insurance_category.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @insurance_category.update(insurance_category_params)
            render json: {  result: @insurance_category }, status: :ok
        else
            render json: {  errors: @insurance_category.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        @insurance_category.destroy
        # if @insurance_category
        #     @insurance_category.discard
        #     render json: { status: :ok, result: ["Successfully deleting the category"], error: nil }
        # else
        #     render json: { status: :unprocessable_entity, result: nil, error: ["Failed deleting the category"]}
        # end
    end

    private

    def find_insurance_category
        @insurance_category = InsuranceCategory.find_by(id: params[:id])
    end

    def insurance_category_params
        params.permit(:name)
    end

end
