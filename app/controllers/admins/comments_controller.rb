class Admins::CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end
end
