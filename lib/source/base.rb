module Source
  class Base
    attr_reader :feed_items

    def feed_items
      # Should return a json array of the items in the feed
    end

    def attribute_map(item)
      # a hash map from json -> covens structure
    end

    def api
      # the base string of the url for the api
    end

    def get(url)
      response = Typhoeus.get(api + url + '.json')
      JSON.parse(response.body)
    end
  end
end
