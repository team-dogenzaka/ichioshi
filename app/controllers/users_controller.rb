class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def new
    if params[:back]
      @user = User.new
      @user.icon.retrieve_from_cache! params[:cache][:icon]
    else
      @user = User.new
    end
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.all
    @user = User.find(params[:id])
    impressionist(@user, nil, :unique => [:session_hash])
    @page_views = @user.impressionist_count
    if current_user != nil
      @feed_items = current_user.feed
      @comment = Comment.new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "ユーザー削除したよ！"
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit( :name, :icon, :coverimg, :coverimg_cache )
  end

  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end