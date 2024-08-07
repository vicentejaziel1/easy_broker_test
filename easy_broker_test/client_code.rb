require_relative 'classes/request_configurator'
require_relative 'classes/properties_getter'
require_relative 'classes/properties_handler'
# These vars should be on .env
key='l7u502p8v46ba3ppgvj5y2aad50lb9'
base_url='https://api.stagingeb.com/v1'

configurator = RequestConfigurator.new(api_key: key, base_url: base_url)
properties_getter = PropertiesGetter.new(configurator: configurator) 
params = {page:1,limit:20}

properties = properties_getter.get(params: params)

properties_handler = PropertiesHandler.new(properties)

puts properties_handler.get_titles
