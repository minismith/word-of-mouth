class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user: @user)
    @restaurants = Restaurant.where(reviews: @reviews)

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
        # info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
      }
    end
  end
end
