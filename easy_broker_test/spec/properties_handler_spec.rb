require_relative '../classes/properties_handler'
require_relative '../classes/properties_getter'
require_relative '../classes/request_configurator'

RSpec.describe PropertiesHandler do
  let(:api_key) { 'l7u502p8v46ba3ppgvj5y2aad50lb9' }
  let(:base_url) { 'https://api.stagingeb.com/v1' }
  let(:configurator) { RequestConfigurator.new(api_key: api_key, base_url: base_url) }
  let(:getter) { PropertiesGetter.new(configurator: configurator) }
  let(:handler) { PropertiesHandler.new(getter.get) }

  describe '#initialize' do
    it 'parses the raw properties JSON' do
      expect(handler.raw_properties).to be_a(Hash)
    end
  end

  describe '#get_titles' do
    it 'returns an array of titles' do
      expect(handler.get_titles).to be_a(Array)
      expect(handler.get_titles.first).to be_a(String)
      expect(handler.get_titles).to include('Casa en Venta Amorada en Santiago Nuevo Leon')
      expect(handler.get_titles).to include('Beautiful property in Condesa.')
      expect(handler.get_titles).to include('testing')
    end
  end
end