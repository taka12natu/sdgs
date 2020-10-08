class Admins::TagsController < ApplicationController

	def index
		@tags = Tag.all
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		@tag.save
		redirect_to request.referer
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to request.referer
	end

	private
	def tag_params
		params.require(:tag).permit(:name)
	end
end
