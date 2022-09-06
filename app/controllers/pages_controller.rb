class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @restaurants = Restaurant.all added for testing, remove if you need
  end
end
