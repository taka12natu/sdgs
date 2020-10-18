class Public::GoalsController < ApplicationController

	def index
		@goals = Goal.all
		binding.pry
	end
end
