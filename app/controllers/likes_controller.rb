class LikesController < ApplicationController
  before_action :find_review
  def create
    @review.likes.create(user_id: current_user.id)
    redirect_to reviews_path(@review)
  end

  private

  def find_review
    @reviews = Review.find(params[:review_id])
  end
end
