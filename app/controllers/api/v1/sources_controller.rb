class Api::V1::SourcesController < Api::V1::BaseController

  def index
    @sources = Post.sources.map {|name| name.to_s.split('::').last }

    respond_with @sources
  end
end
