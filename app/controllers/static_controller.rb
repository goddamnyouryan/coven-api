class StaticController < ApplicationController
  def index
    render json: { error: 'Visit http://api.coven.link/api/v1/posts to get coven posts as json.' }
  end
end
