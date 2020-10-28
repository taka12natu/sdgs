class Admins::GoalsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_application'

  def index
  	@goals = Goal.all
  end

  def show
  	@goal = Goal.find(params[:id])
  end

  def edit
  	@goal = Goal.find(params[:id])
  end

  def update
  	@goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to admins_goal_path(@goal)
    else
      render :edit
    end
  end

  private
  def goal_params
	params.require(:goal).permit(:name, :content)
  end

end
