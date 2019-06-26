class PostsController < ApplicationController
  require 'wikipedia'
  Wikipedia.Configure {
    domain 'ja.wikipedia.org'
    path   'w/api.php'
  }
  def index
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    @wiki = Wikipedia.find(@post.name)
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :description).merge(user_id: current_user.id)
  end
end
