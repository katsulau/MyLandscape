class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6)
  end
end
