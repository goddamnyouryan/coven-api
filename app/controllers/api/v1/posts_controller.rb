class Api::V1::PostsController < Api::V1::BaseController

  def index
    if params[:sources].present?
      @posts = Post.where(source: params[:sources].split(',')).order('position asc')
    else
      @posts = Post.all.order('position asc')
    end

    respond_with @posts
  end
end
