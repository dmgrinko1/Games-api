# frozen_string_literal: true

module Games
  module Rps
    class ValidateRules < ContextBase
      def initialize(user_element)
        @user_element = user_element
      end

      def perform
        return true if Games::Rps::MatchMaking::RULES.key?(@user_element.to_sym)

        raise 'SomeErrorTBD'
      end
    end
  end
end
