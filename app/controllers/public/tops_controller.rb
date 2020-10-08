class Public::TopsController < ApplicationController
	def top
		if user_signed_in?
			@user = current_user
		end
	end

end
