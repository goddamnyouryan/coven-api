require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  describe '.index' do
    context 'if there is no sources param' do
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

        json.each do |hash|
          expect(hash).to have_key('source')
          expect(hash['source_data']).to have_key('name')
          expect(hash['source_data']).to have_key('color')
          expect(hash['source_data']).to have_key('symbol')
        end
      end
    end

    context 'if there is a sources param' do
      before do
        @hn = create :post, source: 'HackerNews'
        @r = create :post, source: 'RProgramming'
        @ph = create :post, source: 'ProductHunt'
      end

      it 'returns posts from those source' do
        get :index, format: :json, sources: 'HackerNews,RProgramming'
        json = JSON response.body
        ids = json.map {|hash| hash['id'] }
        expect(ids).to include(@hn.id)
        expect(ids).to include(@r.id)
        expect(ids).not_to include(@ph.id)
      end
    end
  end
end
