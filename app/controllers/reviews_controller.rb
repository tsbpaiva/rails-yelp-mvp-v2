# first version
class ReviewsController < ApplicationController
  # this one goes away on refactoring, because @review = Review.new is now in the show action of the restaurants controller
  def new
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end


# refactoring
# class ReviewsController < ApplicationController
#   def create
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review = Review.new(review_params)
#     @review.restaurant = @restaurant
#     if @review.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render "restaurants/show", status: :unprocessable_entity
#     end
#   end

#   private

#   def review_params
#     params.require(:review).permit(:rating, :content)
#   end
# end
