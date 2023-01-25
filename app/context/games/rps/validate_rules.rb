# frozen_string_literal: true

module Games
  module Rps
    class ValidateRules < ContextBase
      def initialize(user_element)
        @user_element = user_element
      end

      def perform
        return true if Games::Rps::MatchMaking::RULES.key?(@user_element.to_sym)

        raise ArgumentError, "Invalid element: #{@user_element} is not included in the RULES"
      end
    end
  end
end
