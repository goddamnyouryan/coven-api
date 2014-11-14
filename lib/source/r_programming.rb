module Source
  class RProgramming < Base

    def feed_items
      get('programming')['data']['children'].map {|json| json['data'] }
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: "http://www.reddit.com/#{item['permalink']}",
        external_created_at: Time.at(item['created'])
      }
    end

    def api
      'http://www.reddit.com/r/'
    end
  end
end
