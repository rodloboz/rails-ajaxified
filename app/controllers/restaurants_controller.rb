class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  def destroy
    @restaurant.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
