class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
	def create
		if user_signed_in?
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id
			@comment.post_id = params[:post_id]
			if @comment.save
				post_user_id = @comment.post.user_id
				Notification.create(visitor_id: current_user.id, visited_id: post_user_id, comment_id: @comment.id, action: "comment")
				redirect_to post_path(@comment.post_id)
			 else
			 	flash[:error] = '入力に失敗しました。'
			 	redirect_to request.referer
			 end
		else
			 flash[:error] = 'ログインしないとコメントは送信できません。'
			 redirect_to request.referer
		end
	end

	def destroy
		@comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
		@comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end
