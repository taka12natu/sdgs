class Public::FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
		Notification.create!(visitor_id: current_user.id, visited_id: @post.user.id, post_id: @post.id, action: "favorite")
		redirect_to request.referer
	end

	def destroy
		@post = Post.find(params[:post_id])
		@favorite = Favorite.find_by(user_id: current_user.id,post_id: @post.id)
		@favorite.destroy
		redirect_to request.referer
	end

	def index
	    @user = User.find(params[:user_id])
        @fav_posts = @user.fav_posts
    end

end
