json.array! @posts do |post|
  json.(post, :id, :position, :url, :title, :comments, :comment_count, :external_created_at, :created_at, :source)

  json.source_data do
    json.partial! 'api/v1/sources/source', source: "Source::#{post.source}".constantize
  end
end
