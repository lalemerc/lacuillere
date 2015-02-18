class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :new, :create, :index, :destroy]
  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to @restaurant
    # en renvoie vers le modele et il deduit qu'il veut le show
    # restaurant_path(@restaurant) is the same, its a shortcut
  end

  def index
    @reviews = @restaurant.reviews
    # .reviews vient du model restaurant > has many donc pas besoin de le definir
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @restaurant
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
