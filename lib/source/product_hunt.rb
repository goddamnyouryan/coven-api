module Source
  class ProductHunt < Base
    attr_reader :token

    def initialize
      super
      @token = post('oauth/token', token_options)['access_token']
    end

    def self.color
      '#DA552F'
    end

    def self.symbol
      'P'
    end

    def token_options
      {
        client_id: ENV['PRODUCT_HUNT_CLIENT'],
        client_secret: ENV['PRODUCT_HUNT_SECRET'],
        grant_type: 'client_credentials'
      }
    end

    def feed_items
      get('posts', {}, headers)['posts']
    end

    def headers
      {
        Accept: 'application/json',
        'Content-Type' => 'application/json',
        Authorization: "Bearer #{token}",
      }
    end

    def attribute_map(item)
      {
        url: item['redirect_url'],
        title: "#{item['name']} - #{item['tagline']}",
        comments: item['discussion_url'],
        comment_count: item['comments_count'],
        external_created_at: DateTime.parse(item['created_at'])
      }
    end

    def api
      'https://api.producthunt.com/v1/'
    end
  end
end
