class Api::V1::PostsController < Api::V1::BaseController

  def index
    @posts = Post.all

    respond_with @posts
  end
end
