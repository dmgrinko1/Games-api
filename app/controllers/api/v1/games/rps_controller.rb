# frozen_string_literal: true

module Api
  module V1
    module Games
      class RpsController < Api::BaseController
        def play
          render json: ::Games::Rps::MatchMaking.perform(user_element)
        end

        private

        def user_element
          params.permit(:shape_element)
        end
      end
    end
  end
end
