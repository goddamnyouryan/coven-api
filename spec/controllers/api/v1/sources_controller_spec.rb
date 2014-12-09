require 'rails_helper'

RSpec.describe Api::V1::SourcesController, type: :controller do

  describe '.index' do
    it 'returns all the sources' do
      get :index, format: :json
      json = JSON(response.body)

      Post.sources.each do |source|
        expect(json.map {|h| h['name'] }).to include(source.to_s.split('::').last)
        expect(json.map {|h| h['color'] }).to include(source.color)
        expect(json.map {|h| h['symbol'] }).to include(source.symbol)
      end
    end
  end
end
