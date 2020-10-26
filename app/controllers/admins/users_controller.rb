class Admins::UsersController < ApplicationController
  	before_action :authenticate_admin!
	layout 'admin_application'
  def index
  	@users = User.all.page(params[:page]).per(10)
  end

  def show
  	@user = User.find(params[:id])
  end
end
