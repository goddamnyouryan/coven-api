require 'source/base'

describe Source::Base do

  describe '.get' do
    let(:api) { 'http://www.example.com' }
    let(:url) { 'api' }
    let(:typhoeus) { double('typhoeus', body: 'json response') }

    it 'uses typhoeus to get a response then parses that response' do
      expect_any_instance_of(Source::Base).to receive(:api).and_return(api)
      expect(Typhoeus).to receive(:get).with(api + url + '.json').and_return(typhoeus)
      expect(JSON).to receive(:parse).with(typhoeus.body)
      Source::Base.new.get(url)
    end
  end
end
