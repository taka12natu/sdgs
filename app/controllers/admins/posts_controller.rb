class Admins::PostsController < ApplicationController
	layout 'admin_application'
  def index
  	@posts = Post.all.page(params[:page]).per(10)
  end

  def show
  	@post = Post.find(params[:id])
  	redirect_to "/users/post/#{@post.id}"
  end
end
