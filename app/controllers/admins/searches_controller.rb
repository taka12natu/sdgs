class Admins::SearchesController < ApplicationController
  	before_action :authenticate_admin!
	layout 'admin_application'

	def search
		word = params[:word]
		@range = params[:range]
		if @range == "user"
			@users = User.search(word).page(params[:page]).per(10)
		elsif @range == "post"
			@posts = Post.search(word).includes(:user).page(params[:page]).per(10)
		else
			@comments = Comment.search(word).includes(:post, :user).page(params[:page]).per(10)
		end
	end
end
