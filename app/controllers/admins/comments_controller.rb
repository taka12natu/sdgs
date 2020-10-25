class Admins::CommentsController < ApplicationController
	layout 'admin_application'
	def index
		@comments = Comment.all.page(params[:page]).per(10)
	end
end
