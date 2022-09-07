class ReviewsController < ApplicationController
  # before_action :set_user, only: %i[create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
    @perfect_for = ["Girls night", "Lads night", "Parents visit", "Date night", "Fancy dinner", "Keep it casual"]
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @restaurants = Restaurant.all
    @perfect_for = ["Girls night", "Lads night", "Parents visit", "Date night", "Fancy dinner", "Keep it casual"]
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

  # def set_user
  #   @user = User.find(params[:user_id])
  # end
end
