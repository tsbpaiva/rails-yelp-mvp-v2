class RestaurantsController < ApplicationController
  def new
  end

  def index
    @restaurants = Restaurant.all
  end
end
