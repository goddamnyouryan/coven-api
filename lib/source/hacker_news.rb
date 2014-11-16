module Source
  class HackerNews < Base
    def feed_items
      items = []
      item_ids.each do |item|
        items << get("item/#{item.to_s}")
      end

      items
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
