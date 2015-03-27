require 'source/base'

describe Source::Base do
  describe '#feed_name' do
    it 'returns feed name' do
      expect(Source::ProductHunt.feed_name).to eq('ProductHunt')
    end
  end

  describe '.translate' do
    let(:feed_items) { [1, 2, 3] }

    it 'runs through your feed items and translates them to a common format' do
      expect_any_instance_of(Source::Base).to receive(:feed_items).and_return(feed_items)
      expect(feed_items).to receive(:map)
      Source::Base.new.translate
    end
  end

  describe '.get' do
    let(:api) { 'http://www.example.com' }
    let(:url) { 'api' }
    let(:typhoeus) { double('typhoeus', body: 'json response') }

    it 'uses typhoeus to get a response then parses that response' do
      expect_any_instance_of(Source::Base).to receive(:api).and_return(api)
      expect(Typhoeus).to receive(:get).with(api + url + '.json', params: {}, headers: {}).and_return(typhoeus)
      expect(JSON).to receive(:parse).with(typhoeus.body)
      Source::Base.new.get(url)
    end
  end

  describe '.post' do
    let(:api) { 'http://www.example.com' }
    let(:url) { 'api' }
    let(:typhoeus) { double('typhoeus', body: 'json response') }

    it 'uses typhoeus to get a response then parses that response' do
      expect_any_instance_of(Source::Base).to receive(:api).and_return(api)
      expect(Typhoeus).to receive(:post).with(api + url + '.json', params: {}).and_return(typhoeus)
      expect(JSON).to receive(:parse).with(typhoeus.body)
      Source::Base.new.post(url)
    end
  end
end
