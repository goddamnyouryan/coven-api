require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  describe '/index' do
    it 'returns a json error and directs you to the api url.' do
      get :index
      json = JSON response.body
      expect(json).to have_key('error')
    end
  end
end
