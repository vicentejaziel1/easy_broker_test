require_relative '../classes/properties_getter'
require_relative '../classes/request_configurator'

RSpec.describe PropertiesGetter do
    let(:api_key) { 'l7u502p8v46ba3ppgvj5y2aad50lb9' }
    let(:base_url) { 'https://api.stagingeb.com/v1' }
    let(:configurator) { RequestConfigurator.new(api_key: api_key, base_url: base_url) }
    let(:getter) { PropertiesGetter.new(configurator: configurator) }

    describe '#initialize' do
        it 'correct attributes' do
            expect(getter.configurator).to eq(configurator)
            expect(getter.builder).to be_a(RequestBuilder)
        end
    end

    describe '#get' do
        it 'gets the properties' do
            response = getter.get
            expect(response).to be_a(String)
            expect(response).to include('content')
        end
    end
end