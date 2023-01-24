module Games
  module Rps
    class GetComputerElement < ContextBase
      API_URL = "https://private-anon-9c86f2ff0c-curbrockpaperscissors.apiary-mock.com/rps-stage/throw".freeze
      def perform
        response = HTTParty.get(API_URL)
        computer_element = JSON.parse(response.body)['body']

        computer_element.to_sym
      end
    end
  end
end