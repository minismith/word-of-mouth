class LikesController < ApplicationController
  before_action :find_review, except: [:destroy]
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @review.likes.create(user_id: current_user.id)
      redirect_to reviews_path
    end
  end

  def destroy
      @like.destroy
      # flash[:notice] = "Cannot unlike"
    redirect_to reviews_path
  end

  def find_like
    @like = Like.find(params[:id])
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, review_id:
    params[:review_id]).exists?
  end

  def find_review
    @review = Review.find(params[:review_id])
  end
end
