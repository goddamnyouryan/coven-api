FactoryGirl.define do
  factory :post do
    source { Post.sources.sample.feed_name }
    sequence(:url) {|n| "http://www.example-#{n}.com" }
    title 'A Post'
    comments 'http://www.example.com/comments'
    comment_count 0
    external_created_at Time.current
  end
end
