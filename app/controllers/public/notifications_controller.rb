class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@notifications = Notification.includes(:visitor, :post, :comment).where(visited_id: current_user.id).page(params[:page]).per(10)
  	@notifications.update_all(checked: true)
  end

end
