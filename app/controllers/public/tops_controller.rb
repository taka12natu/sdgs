class Public::TopsController < ApplicationController
	def top
		if user_signed_in?
			@user = current_user
		end
		#仮
		@users = User.all
	end

end
