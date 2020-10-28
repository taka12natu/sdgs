class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  	rank = Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)
	@top_fav_post = Post.find(rank)
  	@notifications = Notification.includes(:visitor, :post, :comment).where(visited_id: current_user.id).page(params[:page]).per(10)
  	@notifications.update_all(checked: true)
  end

end
