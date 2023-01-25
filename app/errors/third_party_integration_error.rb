class ThirdPartyIntegrationError < StandardError
  attr_reader :response

  def initialize(response)
    @response = response
    super("Error communicating with the third-party service: #{response.message}")
  end
end