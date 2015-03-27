module Source
  class Base
    attr_reader :feed_items

    def self.descendants
      ObjectSpace.each_object(::Class).select {|klass| klass < self }
    end

    def self.color
      # string of hex number of brand color
    end

    def self.symbol
      # string of brand symbol
    end

    def self.feed_name
      name.demodulize
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

    def get(path, options = {}, headers = {})
      response = Typhoeus.get(url_for(path), params: options, headers: headers)
      JSON.parse(response.body)
    end

    def post(path, options = {})
      response = Typhoeus.post(url_for(path), params: options)
      JSON.parse(response.body)
    end

    def url_for(path)
      api + path + '.json'
    end
  end
end
