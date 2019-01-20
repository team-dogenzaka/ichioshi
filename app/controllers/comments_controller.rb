class CommentsController < ApplicationController
  after_action :create_notifications_reviewer, only: [:create]
  def new
    @review = Review.find(params[:review_id]) #①
    @comment = Comment.new
  end
  
  def create
    @review = Review.find(params[:review_id]) #①
    @comment = @review.comments.build(comment_params) #②
    @comment.user_id = current_user.id #③
    @comment_number = Comment.count
    if @comment.save
      render :index #④
    end
  end

  def destroy
    @review = Review.find(params[:review_id]) #①
    @comment = Comment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

  private
  def create_notifications_reviewer
    return if @review.user.id == current_user.id
      Notification.create(user_id: @review.user.id,
        notified_by_id: current_user.id,
        review_id: @review.id,
        notified_type: 'コメント')
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :review_id, :user_id)
  end
