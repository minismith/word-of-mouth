class UsersController < ApplicationController
  def show
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @user = User.where(sql_query, query: "%#{params[:query]}%").first
      @user = User.find(params[:id]) if @user.nil?
    else
      @user = User.find(params[:id])
    end


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
