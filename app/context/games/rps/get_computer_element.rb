# frozen_string_literal: true

module Games
  module Rps
    class GetComputerElement < ContextBase
      require 'net/http'
      require 'json'
      def perform
        url = URI('https://private-anon-9c86f2ff0c-curbrockpaperscissors.apiary-mock.com/rps-stage/throw')

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)

        response = http.request(request)

        computer_element = JSON.parse(response.read_body)['body']

        computer_element.to_sym
      end
    end
  end
end
