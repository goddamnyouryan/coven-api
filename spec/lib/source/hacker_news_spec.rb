require 'source/base'
require 'source/hacker_news'
require 'vcr'
require 'support/vcr'

describe Source::HackerNews do

  describe '.feed_items' do
    let(:object) { Source::HackerNews.new }

    it 'returns an array of feed items', :vcr do
      items = object.translate

      expect(items).not_to be_empty

      items.each do |item|
        expect(item).to have_key(:url)
        expect(item).to have_key(:title)
        expect(item).to have_key(:comments)
        expect(item).to have_key(:comment_count)
        expect(item).to have_key(:external_created_at)
      end
    end
  end
end
