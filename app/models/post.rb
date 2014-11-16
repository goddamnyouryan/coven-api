class Post < ActiveRecord::Base
  validates :source, :url, :title, :comments, :external_created_at, :comment_count, presence: true
  validates :url, uniqueness: true

  def self.sync
    Post.destroy_all
    sources.each do |source|
      source.new.translate.each_with_index do |hash, index|
        Post.create hash.merge(source: source.name.demodulize, position: index)
      end
    end
  end

  def self.sources
    Dir[Rails.root.join('lib/source/**/*.rb')].each { |f| require f }
    Source::Base.descendants
  end
end
