module Source
  class Lobsters < Base
    def feed_items
      get('hottest')
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: item['comments_url'],
        external_created_at: DateTime.parse(item['created_at'])
      }
    end

    def api
      'https://www.lobste.rs/'
    end
  end
end
