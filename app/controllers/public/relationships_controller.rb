class Public::RelationshipsController < ApplicationController

	def create
		follow_user = User.find(params[:user_id])
		Relationship.create(follow_id: follow_user.id, user_id: current_user.id)
		redirect_to request.referer
	end

	def destroy
		follow_user = User.find(params[:user_id])
		relationship = Relationship.find_by(follow_id: follow_user.id,user_id: current_user.id)
		relationship.destroy
		redirect_to request.referer
	end
end
