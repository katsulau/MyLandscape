class PostsController < ApplicationController
  require 'wikipedia'
  Wikipedia.Configure do
    domain 'ja.wikipedia.org'
    path   'w/api.php'
  end

  before_action :set_post, only: %i[edit update show]

  def index
    @posts = Post.includes(:user).page(params[:page]).per(9).order("created_at DESC")
  end

  def new; end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def edit; end

  def update
    @post.update(post_params)
    redirect_to post_path(params[:id])
  end

  def show
    @wiki = Wikipedia.find(@post.name)
    @comments = @post.comments.includes(:user)
    posts_ids = Favorite.group(:post_id).order('count_post_id desc').limit(5).count(:post_id).keys
    @ranking = posts_ids.map { |id| Post.find(id) }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :image, :description).merge(user_id: current_user.id)
  end
end
