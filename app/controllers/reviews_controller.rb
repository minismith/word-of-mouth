class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
  end

  # def create
  #   @review = Review.new(review_params)
  # end

end
