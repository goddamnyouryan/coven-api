class Api::V1::SourcesController < Api::V1::BaseController

  def index
    @sources = Post.sources

    respond_with @sources
  end
end
