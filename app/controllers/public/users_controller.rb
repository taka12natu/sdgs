class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @notifications = Notification.where(visited_id: current_user.id, checked: false)
  end

  def my_post
    @user = User.find(params[:user_id])
    @notifications = Notification.where(visited_id: current_user.id, checked: false)
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def favorite_post
    @user = User.find(params[:user_id])
    @notifications = Notification.where(visited_id: current_user.id, checked: false)
    @fav_posts = @user.fav_posts.page(params[:page]).per(5)
  end

  def following
    @user = User.find(params[:user_id])
    @notifications = Notification.where(visited_id: current_user.id, checked: false)
    @follow_users = @user.followings
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    render :edit
  end

  def withdraw
    if @user = current_user
      @user.destroy
      redirect_to action: :complete
    end
  end

  def complete
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :affiliation, :status)
  end
end
