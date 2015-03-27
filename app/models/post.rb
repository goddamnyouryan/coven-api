class Post < ActiveRecord::Base
  validates :source, :url, :title, :comments, :external_created_at, :comment_count, presence: true
  validates :url, uniqueness: true

  def self.sync
    sources.each do |source|
      post_attributes = source.new.translate
      Post.where(source: source.feed_name).delete_all
      post_attributes.each_with_index do |hash, index|
        Post.create hash.merge(source: source.feed_name, position: index)
      end
    end
  end

  def self.sources
    Dir[Rails.root.join('lib/source/**/*.rb')].each { |f| require f }
    Source::Base.descendants
  end
end
