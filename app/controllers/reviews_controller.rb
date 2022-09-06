class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
    @emojis = ["Incredible", "Pretty nice", "Meh", "Disappointing", "Gross"]
    @perfect_for = ["Girls night", "Lads night", "Parents visit", "Date night", "Fancy dinner", "Keep it casual"]
  end

  def create
    @review = Review.new(review_params)
    @restaurants = Restaurant.all
    @emojis = ["Incredible", "Pretty nice", "Meh", "Disappointing", "Gross"]
    @perfect_for = ["Girls night", "Lads night", "Parents visit", "Date night", "Fancy dinner", "Keep it casual"]
    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :content, :emoji, :perfect_for, :photos)
  end

end
