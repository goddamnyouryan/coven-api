module Source
  class HackerNews < Base
    CONCURRENCY = 8

    def self.color
      '#EB974E'
    end

    def self.symbol
      'Y'
    end

    def feed_items
      hydra = Typhoeus::Hydra.new(max_concurrency: CONCURRENCY)

      requests = item_ids.map do |item|
        request = Typhoeus::Request.new(url_for("item/#{item.to_s}"))
        hydra.queue(request)
        request
      end

      hydra.run

      requests.map { |request| JSON.parse(request.response.body, quirks_mode: true) }.compact
    end

    def item_ids
      get 'topstories'
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: "https://news.ycombinator.com/item?id=#{item['id']}",
        comment_count: item.key?('kids') ? item['kids'].count : 0,
        external_created_at: Time.at(item['time'])
      }
    end

    def api
      'https://hacker-news.firebaseio.com/v0/'
    end
  end
end
