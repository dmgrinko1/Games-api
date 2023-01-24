# frozen_string_literal: true

module Games
  module Rps
    class MatchMaking < ContextBase
      RESULTS = { draw: :draw, wins: :wins, lose: :lose }.freeze
      SHAPES = { rock: :rock, paper: :paper, scissors: :scissors }.freeze

      RULES = {
        SHAPES[:rock] => { RESULTS[:wins] => SHAPES[:scissors] },
        SHAPES[:paper] => { RESULTS[:wins] => SHAPES[:rock] },
        SHAPES[:scissors] => { RESULTS[:wins] => SHAPES[:paper] }
      }.freeze

      def initialize(user_element)
        @user_element = user_element['shape_element'].to_sym
      end

      def perform
        validate_rules
        get_computer_element

        start_game
      end

      private

      def start_game
        Games::Rps::Start.perform(@user_element, @computer_element)
      end

      def validate_rules
        Games::Rps::ValidateRules.perform(@user_element)
      end

      def get_computer_element
        @computer_element = Games::Rps::GetComputerElement.perform
      end
    end
  end
end
