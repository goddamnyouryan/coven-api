json.array! @sources do |source|
  json.partial! 'api/v1/sources/source', source: source
end
