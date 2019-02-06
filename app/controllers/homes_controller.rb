class HomesController < ApplicationController
  def index
    @users = User.all
    @review_items = Review.limit(10).order(created_at: :desc)
    @user = current_user
    @tag =  ActsAsTaggableOn::Tag.all
    if user_signed_in?
    @feed_items = current_user.feed.order(created_at: :desc)
    @comment = Comment.new
    @category = Category.all
    else
    end
  end
end
