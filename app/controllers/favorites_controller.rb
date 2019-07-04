class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
  end


  def destroy

  end
end
