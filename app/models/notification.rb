class Notification < ApplicationRecord

	belongs_to :post, optional: true
	belongs_to :comment, optional: true

	default_scope -> { order(created_at: :desc) }
	belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true


	def display_text
  		if action == "favorite"
  			"#{visitor.name}が「#{post.title}」をお気に入りしました。"
  		elsif action == "comment"
  			"#{visitor.name}が「#{comment.post.title}」にコメントしました。"
  		elsif action == "post"
  			"#{visitor.name}が「#{post.title}」を投稿しました。"
  		end
  	end

end
