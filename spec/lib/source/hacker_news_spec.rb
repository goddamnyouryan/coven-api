require 'source/base'
require 'source/hacker_news'
require 'vcr'
require 'support/vcr'

describe Source::HackerNews do

  describe '.feed_items' do
    let(:object) { Source::HackerNews.new }

    it 'returns an array of feed items', :vcr do
      feed_items = object.feed_items

      expect(feed_items).to be_present

      feed_items.each do |item|
        expect(item).to have_key(:id)
        expect(item).to have_key(:url)
        expect(item).to have_key(:title)
        expect(item).to have_key(:external_created_at)
      end
    end
  end
end
