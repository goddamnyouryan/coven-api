require 'source/base'
require 'source/r_programming'
require 'vcr'
require 'support/vcr'

describe Source::RProgramming do

  describe '.feed_items' do
    let(:object) { Source::RProgramming.new }

    it 'returns an array of feed items', :vcr do
      items = object.translate

      expect(items).to be_present

      items.each do |item|
        expect(item).to have_key(:url)
        expect(item).to have_key(:title)
        expect(item).to have_key(:comments)
        expect(item).to have_key(:external_created_at)
      end
    end
  end
end
