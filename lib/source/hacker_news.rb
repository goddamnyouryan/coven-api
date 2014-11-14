module Source
  class HackerNews < Base
    def feed_items
      item_ids.each do |item|
        json = get("item/#{item.to_s}")
        @items << attribute_map(json)
      end

      @items
    end

    def item_ids
      get 'topstories'
    end

    def attribute_map(item)
      {
        url: item['url'],
        title: item['title'],
        comments: "https://news.ycombinator.com/item?id=#{item['id']}",
        external_created_at: Time.at(item['time'])
      }
    end

    def api
      'https://hacker-news.firebaseio.com/v0/'
    end
  end
end
