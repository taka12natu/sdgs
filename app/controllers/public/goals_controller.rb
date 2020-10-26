class Public::GoalsController < ApplicationController

	def index
		@goals = Goal.all
	end

	def show
		@goal = Goal.find(params[:id])
		@goal_posts =@goal.posts.includes(:user).page(params[:page]).per(8)

		rank = Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)
		@top_fav_post = Post.find(rank)
	end
end
