class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :new, :create, :index]
  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to :restaurant_reviews
  end

  def index
    @reviews = @restaurant.reviews
    # .reviews vient du model restaurant > has many donc pas besoin de le definir
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
