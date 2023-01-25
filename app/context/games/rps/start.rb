# frozen_string_literal: true

module Games
  module Rps
    class Start < ContextBase
      def initialize(user_element, computer_element)
        @user_element = user_element
        @computer_element = computer_element
      end

      def perform
        { data: { result: game_result } }
      end

      private

      def game_result
        return Games::Rps::MatchMaking::RESULTS[:draw] if draw?

        Games::Rps::MatchMaking::RULES[@user_element].values.include?(@computer_element) ?
          Games::Rps::MatchMaking::RESULTS[:wins] : Games::Rps::MatchMaking::RESULTS[:lose]
      end

      def draw?
        @user_element == @computer_element
      end
    end
  end
end
