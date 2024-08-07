require 'uri'
require 'net/http'

class RequestBuilder
  attr_accessor :configurator, :endpoint, :params
  def initialize(configurator:, endpoint: nil)
    @configurator = configurator
    @endpoint = validated_endpoint(endpoint)
  end
  
  def build(params: nil)
    @params = params
    url = URI(configurator.base_url + endpoint + param_builder)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["X-Authorization"] = configurator.api_key
    
    http.request(request)
  end
  
  private
  def validated_endpoint(ep)
    raise 'Endpoint invalid' if ep.nil?
    return ep
  end
  
  def param_builder
    return '' if params.nil?
    
    '?' + params.map{|key, value| "#{key}=#{value}"}.join('&')
  end
end