Dotenv.load
require 'source/base'
require 'source/product_hunt'
require 'vcr'
require 'support/vcr'

describe Source::ProductHunt do

  describe '.new' do
    let(:object) { Source::ProductHunt.new }

    it 'authorizes via oauth', :vcr do
      object
    end
  end

  describe '.feed_items' do
    let(:object) { Source::ProductHunt.new }

    it 'returns an array of feed items', :vcr do
      items = object.translate

      expect(items).to be_present

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
