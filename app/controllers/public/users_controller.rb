class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @fav_posts = @user.fav_posts
    @posts = @user.posts
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
  end

  def complete
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :category)
  end
end
