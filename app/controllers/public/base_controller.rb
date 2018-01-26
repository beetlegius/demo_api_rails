module Public
  class BaseController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::RoutingError, with: :routing_error
    rescue_from CanCan::AccessDenied, with: :access_denied

    private

    def access_denied(error)
      render json: { error: error }, status: :forbidden
    end

    def record_invalid(error)
      render json: { error: error }, status: :unprocessable_entity
    end

    def record_not_found(error)
      render json: { error: error }, status: :not_found
    end

    def routing_error(error)
      render json: { error: error }, status: :not_found
    end
  end
end
