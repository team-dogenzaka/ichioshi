class UsersController < ApplicationController
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
    @user = User.find(params[:id])
    @review  = current_user.reviews.build
    @feed_items = current_user.feed 
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザー削除したよ！"
  end

  def user_params
    params.require(:user).permit( :name, :icon )
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    @review  = current_user.reviews.build
    @feed_items = current_user.feed      
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
end
