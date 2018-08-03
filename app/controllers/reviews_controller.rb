class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
  
  def new
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to new_review_path
  end
  
  def show
  @review = Review.find(params[:id])
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :content)
  end

end
