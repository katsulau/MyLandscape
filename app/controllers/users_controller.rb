class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6)
  end

  def update
    user = User.find(params[:id])
      user.update(user_params)
      redirect_to user_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
