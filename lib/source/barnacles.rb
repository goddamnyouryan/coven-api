module Source
  class Barnacles < Base

    def self.color
      '#20010d'
    end

    def self.symbol
      'B'
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
      'https://barnacl.es/'
    end
  end
end
