class Public::UsersController < ApplicationController

  def show
    @user = current_user
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
