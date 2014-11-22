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
      items.each_with_index do |item, index|
        expect(item).to have_key(:url)
        expect(item).to have_key(:title)
        expect(item).to have_key(:comments)
        expect(item).to have_key(:comment_count)
        expect(item).to have_key(:external_created_at)
        expect(item[:external_created_at] > Time.current).to be(false)
      end
    end
  end
end
