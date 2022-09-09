class RestaurantsController < ApplicationController

  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_address(params[:query])
      @markers = @restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
        }
      end

    elsif params[:query1].present?

      @restaurants = Restaurant.search_by_name_and_address(params[:query1])

     @markers = @restaurants.geocoded.map do |restaurant|
       {
         lat: restaurant.latitude,
         lng: restaurant.longitude,
         info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
       }
     end

    else
      @restaurants = Restaurant.all
      @markers = @restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
        }
      end
    end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: params[:id])
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      info_window: render_to_string(partial: "info_window", locals: {restaurant: @restaurant})
    }]
  end
end
