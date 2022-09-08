class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = User.review

  end
end
