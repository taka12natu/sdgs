class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_application'

	def index
		@comments = Comment.includes(:post, :user).all.page(params[:page]).per(10)
	end
end
