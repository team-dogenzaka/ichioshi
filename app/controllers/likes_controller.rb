class LikesController < ApplicationController
  
  

  def create
    @review = Review.find(params[:review_id])
    unless @review.iine?(current_user)
      @review.iine(current_user)
      @review.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @review = Like.find(params[:id]).review
    if @review.iine?(current_user)
      @review.uniine(current_user)
      @review.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end