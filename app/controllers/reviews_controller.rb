class ReviewsController < ApplicationController

  def index
    @friends = current_user.friends
    @reviews = Review.where(user: @friends).or(Review.where(user: current_user))
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
    @cuisines = ['American', 'Italian', 'Indian', 'Chinese', 'French', 'Thai', 'Korean', 'Vietnamese', 'Ethiopian', 'Argentinian', 'North African', 'Bangladeshi', 'Sri Lankan', 'Malaysian', 'Caribbean', 'Mexican', 'Middle Eastern', 'Turkish', 'Japanese', 'Spanish','Greek']
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @restaurants = Restaurant.all
    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :content, :emoji, perfect_for: [])
  end
end
