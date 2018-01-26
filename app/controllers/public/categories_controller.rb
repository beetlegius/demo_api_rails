module Public
  class CategoriesController < BaseController
    load_and_authorize_resource

    def index
      render json: @categories
    end

    def show
      render json: @category
    end

    def create
      @category.save!
      render json: @category, status: :created, location: @category
    end

    def update
      @category.update! category_params
      render json: @category, location: @category
    end

    def destroy
      @category.destroy
      head 204
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
