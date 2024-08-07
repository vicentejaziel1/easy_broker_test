class RequestConfigurator
	attr_accessor :api_key, :base_url
	def initialize(api_key: nil, base_url: nil)
		@base_url = base_url
		@api_key = api_key
		
		validate_config
	end
	
	private
	def validate_config
		raise 'Invalid url' if base_url.nil?
		raise 'Invalid key' if api_key.nil?
	end
end