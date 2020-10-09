class Public::PostsController < ApplicationController

	def index
		#キーワード検索時
		if params[:word].present?
			@posts = Post.search(params[:word])
		#タグ検索時
		elsif params[:tag_id].present?
			@posts = Tag.find(params[:tag_id]).posts
		else
			@posts = Post.all
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :goal_id, { tag_ids: [] })
	end
end
