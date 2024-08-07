require_relative '../classes/request_configurator'

RSpec.describe RequestConfigurator do
    let(:api_key) { 'testkey123' }
    let(:base_url) { 'base_url.com' }
    let(:configurator) { RequestConfigurator.new(api_key: api_key, base_url: base_url) }
    let(:bad_configurator) { RequestConfigurator.new(api_key: nil, base_url: base_url) }
  
    describe '#initialize' do
      it 'corretc attributes' do
        expect(configurator.api_key).to eq(api_key)
        expect(configurator.base_url).to eq(base_url)
      end
    end
  
    describe '#validate_config' do
        it 'raises an error if the base key is missing' do
            expect { bad_configurator }.to raise_error('Invalid key')
        end
    end
end