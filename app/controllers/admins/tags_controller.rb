class Admins::TagsController < ApplicationController
  	before_action :authenticate_admin!
	layout 'admin_application'

	def index
		@tags = Tag.all.page(params[:page]).per(10)
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
