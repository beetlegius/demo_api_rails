module Public
  class ProductsController < BaseController
    load_resource :category
    load_and_authorize_resource through: :category, shallow: true

    def index
      @products = @products.includes(:category)
      render json: @products
    end

    def show
      render json: @product
    end

    def create
      @product.save!
      render json: @product, status: :created, location: @product
    end

    def update
      @product.update! product_params
      render json: @product, location: @product
    end

    def destroy
      @product.destroy
      head 204
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end

  end
end
