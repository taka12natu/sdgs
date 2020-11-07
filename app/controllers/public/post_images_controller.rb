class Public::PostImagesController < ApplicationController

	def index
		if params[:search_tag].present?
			@post_images = PostImage.includes([:post]).joins([:post, :image_tags]).where("image_tags.name = ?", params[:search_tag]).page(params[:page]).per(12)
		else
			@post_images = PostImage.includes([:post]).all.page(params[:page]).per(12)
		end
		rank = Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(3).pluck(:post_id)
		@top_fav_post = Post.includes([:post_images]).find(rank)
		@image_tags = ImageTag.group(:name).order('count_name desc').count('name').keys
	end
end
