require_relative '../classes/request_builder'
require_relative '../classes/request_configurator'
RSpec.describe RequestBuilder do
    let(:url) {'https://api.stagingeb.com/v1'}
    let(:endpoint) {'/properties'}
    let(:key) {'l7u502p8v46ba3ppgvj5y2aad50lb9'}
    let(:params) { { key_one: 'value1', key_two: 'value2' } }
    let(:configurator) { RequestConfigurator.new(api_key: key, base_url: url) }
    let(:builder) { RequestBuilder.new(configurator: configurator, endpoint: endpoint) }
    let(:bad_builder) { RequestBuilder.new(configurator: configurator) }
  
    describe '#initialize' do
      it 'sets the configurator and endpoint' do
        expect(builder.configurator).to eq(configurator)
        expect(builder.endpoint).to eq('/properties')
      end
  
      it 'raises an error if the endpoint is missing' do
        expect { bad_builder }.to raise_error('Endpoint invalid')
      end
    end
  
    describe '#build' do
      it 'constructs the full URL with endpoint and parameters' do
        request = builder.build(params: params)
        expect(request).to be_a(Net::HTTPOK)
      end
    end
  end