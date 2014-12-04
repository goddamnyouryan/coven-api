require 'rails_helper'

RSpec.describe Api::V1::SourcesController, type: :controller do

  describe '.index' do
    it 'returns all the source names' do
      get :index, format: :json
      json = JSON(response.body)

      Post.sources.each do |source|
        expect(json).to include(source.to_s.split('::').last)
      end
    end
  end
end
