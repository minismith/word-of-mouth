class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user: @user)
    @restaurant = Restaurant.where(Restaurant: @restaurant)

  end
end
