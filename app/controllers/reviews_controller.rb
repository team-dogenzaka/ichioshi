class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  PER = 6
  def index
    @review = Review.where(draft: true).page(params[:page]).per(PER)
    @hashtags = Hashtag.all
  end

  def new
    if user_signed_in?
      if params[:back]
        @review = Review.new(review_params)
      else
        @review = Review.new
      end
    else
      redirect_to users_path, notice: "ログインしてね！"
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
    str = @review.content                              # [追加箇所]                                             #
    @hashtags = str.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/).map(&:strip)                         # 最終行がシャープで始まっていればハッシュタブということにする
    @hashtags.each do |hashtag|
      exitTag = Hashtag.find_by(hashname: hashtag.delete('#＃')) # 既に存在しているハッシュタグか確認
      if exitTag == nil                            #
        @hashTag = Hashtag.new                      # 存在しなければハッシュタグを新規作成        
        @hashTag.hashname = hashtag.delete('#＃')                 #
        @review.hashtags << @hashTag              # ハッシュタグとツイートの関連付け
        @hashTag.save                               #
      else                                         #
        @review.hashtags << exitTag                  # ハッシュタグとツイートの関連付け
      end
    end
    if @review.save
      if !session[:hashtag]   
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to reviews_path, notice: "レビューを作成しました！"
      end
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
    if current_user
     @favorite = current_user.favorites.find_by(review_id: @review.id)
    end
    @post_user = @review.user
    @comment = Comment.new #①
    @comments = @review.comments #②
    @comments_number = @comments.count
    @hashTag = Hashtag.find_by(hashname: params[:id])                # [追加箇所]
    if @hashTag == nil || @hashTag.reviews.empty?                # 「:id」でハッシュタグを検索
      session[:hashtag] = nil                                 # 存在しなければindexへリダイレクト
      return                                                  #
    else                                                      #
      session[:hashtag] = params[:id]                         # ハッシュタグが存在すれば
      @reviews = @hashTag.reviews.order("created_at DESC") # そのハッシュタグのツイートを全て取得
      @review = Review.new                                      #
      @hashtags = Hashtag.all                                 #
    end
    binding.pry
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
    @review.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
    render :new if @review.invalid?
  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :user_id, :name, :image, :image_cache, :draft, :comment_content, :review_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
