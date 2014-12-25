module Source
  class RProgramming < Base

    def feed_items
      get('programming')['data']['children'].map {|json| json['data'] }
    end

    def self.color
      '#59ABE3'
    end

    def self.symbol
      'r'
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: "http://www.reddit.com#{item['permalink']}",
        comment_count: item['num_comments'],
        external_created_at: Time.at(item['created_utc']).in_time_zone
      }
    end

    def api
      'http://www.reddit.com/r/'
    end
  end
end
