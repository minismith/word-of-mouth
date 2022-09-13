class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @bookmark.restaurant = @restaurant
    @bookmark.user = current_user
    if @bookmark.save
      # redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def bookmark_params
    params.permit(:restaurant_id)
  end
end
