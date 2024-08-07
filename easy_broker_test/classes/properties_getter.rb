require_relative 'request_builder'

class PropertiesGetter
  ENDPOINT = '/properties'
  attr_accessor :configurator, :builder
  def initialize(configurator:)
    @configurator = configurator
    @builder = RequestBuilder.new(configurator: configurator, endpoint: ENDPOINT)
  end
  
  def get(params: nil)
    response = builder.build(params: params)

    response.read_body
  end
end