class Public::NotificationsController < ApplicationController

  def index
  	rank = Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)
	@top_fav_post = Post.find(rank)
  	@notifications = Notification.where(visited_id: current_user.id).page(params[:page]).per(15)
  	@notifications.update_all(checked: true)
  end

end
