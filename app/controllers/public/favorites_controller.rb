class Public::FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
		redirect_to request.referer
	end

	def destroy
		@post = Post.find(params[:post_id])
		@favorite = Favorite.find_by(user_id: current_user.id,post_id: @post.id)
		@favorite.destroy
		redirect_to request.referer
	end

end
