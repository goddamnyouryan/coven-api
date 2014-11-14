module Source
  class Base
    attr_reader :feed_items

    def self.descendants
      ObjectSpace.each_object(::Class).select {|klass| klass < self }
    end

    def feed_items
      # Should return a json array of the items in the feed
    end

    def translate
      feed_items.map {|item| attribute_map(item) }
    end

    def attribute_map(item)
      # a hash map from json -> covens structure
    end

    def api
      # the base string of the url for the api
    end

    def get(url, options = {}, headers = {})
      response = Typhoeus.get(api + url + '.json', params: options, headers: headers)
      JSON.parse(response.body)
    end

    def post(url, options = {})
      response = Typhoeus.post(api + url + '.json', params: options)
      JSON.parse(response.body)
    end
  end
end
