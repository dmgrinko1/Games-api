# frozen_string_literal: true

module Games
  module Rps
    class Start < ContextBase
      def initialize(user_element, computer_element)
        @user_element = user_element
        @computer_element = computer_element
      end

      def perform
        draw? ? prepare_response_hash(Games::Rps::MatchMaking::RESULTS[:draw]) : prepare_response_hash(game_result)
      end

      private

      def draw?
        @user_element == @computer_element
      end

      def game_result
        Games::Rps::MatchMaking::RULES[@user_element].values.include?(@computer_element) ? Games::Rps::MatchMaking::RESULTS[:wins] : Games::Rps::MatchMaking::RESULTS[:lose]
      end

      def prepare_response_hash(result)
        { data: { result: } }
      end
    end
  end
end
