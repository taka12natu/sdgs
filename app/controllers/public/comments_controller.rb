class Public::CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = params[:post_id]
		if @comment.save
			redirect_to post_path(@comment.post_id)
		 else
		 	redirect_to request.referer
		 end
	end


	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
