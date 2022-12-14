class ReviewsController < ApplicationController
  def index
    @friends = current_user.friends
    @reviews = Review.where(user: @friends).or(Review.where(user: current_user)).order(created_at: :desc)
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @restaurants = Restaurant.all
    if @review.save
      restaurant = @review.restaurant
      update_restaurant_perfect_fors(restaurant)
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
    @restaurant_id

  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :content, :emoji, perfect_for: [], photos: [])
  end

  def update_restaurant_perfect_fors(restaurant)
    restaurant.update_attribute :perfect_for, @review.perfect_for
  end
end
