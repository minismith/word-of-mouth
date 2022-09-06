class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
  end
end
