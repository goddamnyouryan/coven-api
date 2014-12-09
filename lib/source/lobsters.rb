module Source
  class Lobsters < Base

    def self.color
      '#96281B'
    end

    def self.symbol
      'L'
    end

    def feed_items
      get('hottest')
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: item['comments_url'],
        comment_count: item['comment_count'],
        external_created_at: DateTime.parse(item['created_at'])
      }
    end

    def api
      'https://www.lobste.rs/'
    end
  end
end
