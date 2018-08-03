class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @review = Review.all
  end
  
  def new
    if params[:back]
      @review = Review.new(review_params)
    else
      @review = Review.new
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to reviews_path, notice: "レビューを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice:"ブログを削除しました！"
  end

  def confirm
    @review = Review.new(review_params)
    render :new if @review.invalid?
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
