module Api
    class BaseController < ApplicationController
      rescue_from ThirdPartyIntegrationError, with: :handle_500_error
    end

    private

    def handle_500_error
      render json: { message: 'An error occurred while processing your request.' }, status: :internal_server_error
    end
end
