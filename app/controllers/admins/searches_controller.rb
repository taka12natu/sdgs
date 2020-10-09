class Admins::SearchesController < ApplicationController

	def search
		word = params[:word]
		@range = params[:range]
		if @range == "user"
			@users = User.search(word)
		elsif @range == "post"
			@posts = Post.search(word)
		else
			@comments = Comment.search(word)
		end
	end
end
