require 'source/base'
require 'source/barnacles'
require 'vcr'
require 'support/vcr'

describe Source::Barnacles do

  describe '.feed_items' do
    let(:object) { Source::Barnacles.new }

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
