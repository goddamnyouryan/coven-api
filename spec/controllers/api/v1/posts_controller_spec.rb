require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  describe '.index' do
    before do
      @posts = create_list :post, 3
    end

    it 'returns posts' do
      get :index, format: :json
      json = JSON response.body
      ids = json.map {|hash| hash['id'] }
      @posts.each do |post|
        expect(ids).to include(post.id)
      end
    end
  end
end
