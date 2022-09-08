class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
    @perfect_for = ["Date night", "Parents in town", "Boozing", "Friend catch-up", "Cheap eats", "Pay day", "Birthday dinner", "Group hang", "Wasting money", "Second date"]
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @restaurants = Restaurant.all
    @perfect_for = ["Date night", "Parents in town", "Boozing", "Friend catch-up", "Cheap eats", "Pay day", "Birthday dinner", "Group hang", "Wasting money", "Second date"]
    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :content, :emoji, :perfect_for)
  end
end
