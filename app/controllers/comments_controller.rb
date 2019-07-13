class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
