class Admins::CommentsController < ApplicationController
	def index
		@comments = Comment.all.page(params[:page]).per(10)
	end
end
