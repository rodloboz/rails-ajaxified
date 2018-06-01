class ReviewsController < ApplicationController
  before_action :set_restaurant, only: :create

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      respond_to do |format|
        format.html { redirect_to @restaurant }
        format.js # will run create.js.erb
      end
    else
      respond_to do |format|
        @reviews = @restaurant.reviews
        format.html { render 'restaurants/show' }
        format.js # same as above
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
