class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

	def index
		#キーワード検索時
		if params[:word].present?
			@posts = Post.search(params[:word]).order("created_at desc").page(params[:page]).per(5)
		#タグ検索時
		elsif params[:tag_id].present?
			@posts = Tag.find(params[:tag_id]).posts.order("created_at desc").page(params[:page]).per(5)
		else
			@posts = Post.includes(:user).all.order("created_at desc").page(params[:page]).per(8)
		end
		rank = Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)
		@top_fav_post = Post.includes([:post_images]).find(rank)
		@random_post = Post.includes(:post_images).order("RAND()").limit(5)
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.order("created_at desc").page(params[:page]).per(4)
		@comment = Comment.new
		rank = Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)
		@top_fav_post = Post.includes([:post_images]).find(rank)
	end

	def new
		@post = Post.new
	end

	def confirm
		@post = Post.new(post_params)
	end

	def back
		@post = Post.new(post_params)
		render :new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
		  #フォロワーに投稿通知を送信
			followed_users = current_user.followers
			unless followed_users.blank?
				followed_users.each do |followed_user|
					Notification.create(visitor_id: current_user.id, visited_id: followed_user.id, post_id: @post.id, action: "post")
				end
			end
		  #google vision & translation apiでタグ作成
		  	@post.post_images_images.each do |image|
				image_tags = Vision.get_image_tag(image)
				image_tags.each do |image_tag|
					post_image = PostImage.find_by(image_id: image.id)
					image_tag = Translation.translate_to_japanese(image_tag)
      				ImageTag.create(name: image_tag, post_image_id: post_image.id)
				end
    		end
			redirect_to post_path(@post)
		else
      		render :new
      	end
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
		params.require(:post).permit(:title, :body, :goal_id, post_images_images: [], tag_ids: [] )
	end
end
