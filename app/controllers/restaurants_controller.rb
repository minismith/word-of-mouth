class RestaurantsController < ApplicationController
  require "open-uri"
  require "json"

  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_address(params[:query])
      @markers = @restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
          image_url: helpers.asset_url("pinkmarker.png")
        }
      end

    elsif params[:query1].present?

      @restaurants = Restaurant.search_by_name_and_address(params[:query1])

     @markers = @restaurants.geocoded.map do |restaurant|
       {
         lat: restaurant.latitude,
         lng: restaurant.longitude,
         info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
         image_url: helpers.asset_url("marker.png")
       }
     end

    else
      @restaurants = Restaurant.all
      @markers = @restaurants.geocoded.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
          image_url: helpers.asset_url("marker.png")

        }
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

  def new
    @restaurant = Restaurant.new
    @cuisines = ['American', 'Italian', 'English', 'Indian', 'Chinese', 'French', 'Thai', 'Korean', 'Vietnamese', 'Ethiopian', 'Argentinian', 'North African', 'Bangladeshi', 'Sri Lankan', 'Malaysian', 'Caribbean', 'Mexican', 'Middle Eastern', 'Turkish', 'Japanese', 'Spanish','Greek'].sort
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    key = ENV['GOOGLE_MAPS_API_KEY']
    id_url = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{@restaurant.name}&inputtype=textquery&locationbias=ipbias&fields=place_id&key=#{key}")
    restaurant_serialized = URI.open(id_url).read
    restaurant_basics = JSON.parse(restaurant_serialized)
    place_id = restaurant_basics["candidates"][0]["place_id"]

    details_url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Copening_hours/weekday_text%2Cgeometry/location%2Cprice_level%2Cgeometry/location%2Cformatted_address%2Cwebsite&key=#{key}")
    details_serialized = URI.open(details_url).read
    restaurant_details = JSON.parse(details_serialized)
    @restaurant.name = restaurant_details["result"]["name"]
    @restaurant.address = restaurant_details["result"]["formatted_address"]
    @restaurant.website = restaurant_details["result"]["website"]
    @restaurant.opening_hours = restaurant_details["result"]["opening_hours"]["weekday_text"]
    @restaurant.latitude = restaurant_details["result"]["geometry"]["location"]["lat"]
    @restaurant.longitude = restaurant_details["result"]["geometry"]["location"]["lng"]

    if restaurant_details["result"]["price_level"] == 1
      @restaurant.price = "£"
    elsif restaurant_details["result"]["price_level"] == 2
      @restaurant.price = "££"
    else
      @restaurant.price = "£££"
    end

    if @restaurant.save
      redirect_to new_review_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :cuisine, :price)
  end
end
