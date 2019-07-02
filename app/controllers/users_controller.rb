class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show, :update]

  def edit
  end

  def show
    @posts = @user.posts.page(params[:page]).per(6)
  end

  def update
      @user.update(user_params)
      redirect_to user_path(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
