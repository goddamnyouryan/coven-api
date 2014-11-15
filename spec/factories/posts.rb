FactoryGirl.define do
  factory :post do
    source 'HackerNews'
    sequence(:url) {|n| "http://www.example-#{n}.com" }
    title 'A Post'
    comments 'http://www.example.com/comments'
    external_created_at Time.current
  end
end
